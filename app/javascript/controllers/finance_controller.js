import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    async connect() {
        // const response = await fetch('http://localhost:3000/api/v1/charts/index');
        const data = await fetch('http://localhost:3000/api/v1/finance/index');


        Highcharts.chart('container', {
            chart: {
                type: 'column'
            },
            title: {
                text: 'Monthly Gross Income'
            },

            xAxis: {
                categories: [
                    'Jan',
                    'Feb',
                    'Mar',
                    'Apr',
                    'May',
                    'Jun',
                    'Jul',
                    'Aug',
                    'Sep',
                    'Oct',
                    'Nov',
                    'Dec'
                ],
                crosshair: true
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Dollars'
                }
            },

            tooltip: {

                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>${point.y:,.0f}</b></td></tr>',
                valuePrefix: '$',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            dataLabels: {
                enabled: true,
                format: '{point.y:,.2f}'
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [{
                name: "Gross Income",
                data: [data.json]


            }]
        });
    }

}