import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        let series

        async function requestData() {


            const response = await fetch('https://operation-mist.herokuapp.com/api/v1/finance/index');
            // const response = await fetch('http://localhost:3000/api/v1/finance/index');

            if (response.ok) {
                const data = await response.json()
                series = data.map(function (month, i) {
                    return {
                        name: month[0],
                        data: month[1]
                    };
                });
                console.log(series)
            }
            Highcharts.chart('container2', {
                chart: {
                    type: 'column',
                    backgroundColor: 'transparent',
                    labels: {
                        style: {
                            color: '#ffffff'
                        }
                    },
                },
                label: {
                    style: {
                        color: '#ffffff'
                    }
                },
                title: {
                    text: 'Monthly Gross Income(2022)',
                    style: {
                        color: '#ffffff',
                        fontWeight: 'bold'
                    }
                },

                legend: {
                    itemStyle: {
                        color: 'white'
                    }
                },
                subtitle: {
                    text: ""
                },
                xAxis: {
                    categories: [
                        "Monthly Income"
                    ],
                    labels: {
                        style: {
                            color: '#ffffff'
                        }
                    },

                    crosshair: false
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Gross Income',
                        style: {
                            color: '#ffffff'
                        }
                    },
                    labels: {
                        style: {
                            color: '#ffffff'
                        }
                    },
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>${point.y:,.1f} </b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: series
            });
        }

        window.addEventListener('load', async () => {
            await requestData();
        });

    }
}
