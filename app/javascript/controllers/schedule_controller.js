import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        Highcharts.chart('container', {

            title: {
                text: 'Solar Employment Growth by Sector, 2010-2016'
            },

            subtitle: {
                text: 'Source: thesolarfoundation.com'
            },

            yAxis: {
                title: {
                    text: 'Number of Employees'
                }
            },

            xAxis: {
                accessibility: {
                    rangeDescription: 'Range: 2010 to 2017'
                }
            },

            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },

            plotOptions: {
                series: {
                    label: {
                        connectorAllowed: false
                    },
                    pointStart: 2010
                }
            },

            series: [{
                name: '<%= Job.first.name %>',
                data: [43934, 52503]
            }, {
                name: 'Manufacturing',
                data: [24916, 24064]
            }, {
                name: 'Sales & Distribution',
                data: [11744, 17722]
            }, {
                name: 'Project Development',
                data: [null, null]
            }, {
                name: 'Other',
                data: [12908, 5948]
            }],

            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }

        });
    }
}