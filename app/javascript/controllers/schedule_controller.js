import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

    connect() {

        let today = new Date(),
            day = 1000 * 60 * 60 * 24;
        today.setUTCHours(0);
        today.setUTCMinutes(0);
        today.setUTCSeconds(0);
        today.setUTCMilliseconds(0);
        today = today.getTime();
        let dateFormat = Highgantt.dateFormat;
        let series
        let chart; // global
        /**
         * Request data from the server, add it to the graph and set a timeout to request again
         */


        async function requestData() {
            const response = await fetch('http://localhost:3000/api/v1/charts/index');
            // const response = await fetch('https://operation-mist.herokuapp.com/api/v1/charts/index');

            if (response.ok) {
                const data = await response.json();
                series = data.map(function (job, i) {
                    let data = job.deals.map(function (phase) {
                        return {
                            id: 'deal-' + i,
                            project: phase.project,
                            client: phase.client,
                            phase: phase.phase,
                            start: new Date(phase.from).getTime(),
                            end: new Date(phase.to).getTime(),
                            y: i
                        };
                    });
                    return {
                        name: job.name,
                        data: data,
                        current: job.deals[job.current]
                    };
                });


                chart = await Highgantt.ganttChart('container1', {

                    series: await series,

                    title: {
                        text: 'Crew Schedule'
                    },
                    tooltip: {
                        pointFormat: '<span>Client {point.client}</span><br/>' +
                            '<span>Project: {point.project}</span><br/>' +
                            '<span>Phase: {point.phase}</span><br/>' +
                            '<span>From: {point.start:%e. %b}</span><br/><span>To: {point.end:%e. %b}</span>'
                    },
                    lang: {
                        accessibility: {
                            axis: {
                                xAxisDescriptionPlural: 'The chart has a two-part X axis showing time in both week numbers and days.',
                                yAxisDescriptionSingular: 'The chart has a tabular Y axis showing a data table row for each point.'
                            }
                        }
                    },
                    scrollbar: {
                        enabled: true
                    },
                    rangeSelector: {
                        enabled: true,
                        selected: 0,
                    },
                    accessibility: {
                        keyboardNavigation: {
                            seriesNavigation: {
                                mode: 'serialize'
                            }
                        },
                        point: {
                            valueDescriptionFormat: 'Assigned to {point.project} from {point.x2:%A, %B %e} to {point.x2:%A, %B %e}.'
                        },
                        series: {
                            descriptionFormatter: function (series) {
                                return series.name + ', job ' + (series.index + 1) + ' of ' + series.chart.series.length + '.';
                            }
                        }
                    },
                    xAxis: {
                        currentDateIndicator: true,
                        crosshair: {
                            snap: false
                        }
                    },
                    navigator: {
                        enabled: true,
                        liveRedraw: true,
                        series: {
                            type: 'gantt',
                            pointPlacement: 0.5,
                            pointPadding: 0.25,
                            accessibility: {
                                enabled: false
                            }
                        },
                        yAxis: {
                            min: 0,
                            max: 6,
                            reversed: true,
                            categories: []
                        }
                    },
                    yAxis: {
                        type: 'category',
                        grid: {
                            columns: [{
                                title: {
                                    text: 'Crew'
                                },
                                categories: series.map(function (s) {
                                    return s.name;
                                })
                            }]
                        }
                    }
                })
            } else {

                console.log(series);
            }

        }


        async function setDate() {
            const date = new Date();

            let day = date.getDate();
            let month = date.getMonth();
            let year = date.getFullYear();
            const xAxis = chart.xAxis[0];
            return xAxis.setExtremes(Date.UTC(year, month, day), Date.UTC(year, month, day + 21));
        };


        window.addEventListener('load', async () => {
            await requestData().then(r => setDate());
        });

    }

}
