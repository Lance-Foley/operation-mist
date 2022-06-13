import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
   
        const dataSource = {
            chart: {
                caption: "Weekly Crew Schedule",
                subcaption: "Bruckelmyer Brothers",
                dateformat: "mm/dd/yyyy hh:mm:ss",
                outputdateformat: "ddds mnl, yyyy hh12:mn ampm",
                theme: "fusion",
                plottooltext: "<b>$label</b><br>Start: <b>$start</b><br>End: <b>$end</b>"
            },
            tasks: {
                showlabels: "0",
                color: "#5D62B5",
                task: [
                    {
                        processid: "MC7",
                        start: "04/02/2018 07:00:00",
                        end: "04/02/2018 17:00:00",
                        label: "10 Hrs"
                    },
                    {
                        processid: "MC7",
                        start: "04/04/2018 12:00:00",
                        end: "04/04/2018 23:00:00",
                        label: "11 Hrs"
                    },
                    {
                        processid: "MC7",
                        start: "04/06/2018 12:00:00",
                        end: "04/06/2018 23:00:00",
                        label: "11 Hrs"
                    },
                    {
                        processid: "MC6",
                        start: "04/02/2018 8:00:00",
                        end: "04/02/2018 16:00:00",
                        label: "8 Hrs"
                    },
                    {
                        processid: "MC6",
                        start: "04/07/2018 8:00:00",
                        end: "04/07/2018 16:00:00",
                        label: "8 Hrs"
                    },
                    {
                        processid: "MC5",
                        start: "04/04/2018 10:00:00",
                        end: "04/04/2018 23:00:00",
                        label: "13 Hrs"
                    },
                    {
                        processid: "MC4",
                        start: "04/03/2018 13:30:00",
                        end: "04/03/2018 22:30:00",
                        label: "9 Hrs"
                    },
                    {
                        processid: "MC4",
                        start: "04/06/2018 13:30:00",
                        end: "04/06/2018 22:30:00",
                        label: "9 Hrs"
                    },
                    {
                        processid: "MC3",
                        start: "04/05/2018 11:30:00",
                        end: "04/05/2018 22:30:00",
                        label: "11 Hrs"
                    },
                    {
                        processid: "MC2",
                        start: "04/07/2018 13:30:00",
                        end: "04/07/2018 23:30:00",
                        label: "10 Hrs"
                    },
                    {
                        processid: "MC1",
                        start: "04/04/2018 11:45:00",
                        end: "04/04/2018 23:45:00",
                        label: "12 Hrs"
                    }
                ]
            },
            processes: {
                align: "left",
                headertext: "Tasks",
                headervalign: "middle",
                headeralign: "left",
                process: [
                    {
                        label: "Field 1",
                        id: "MC1"
                    },
                    {
                        label: "Field 2",
                        id: "MC2"
                    },
                    {
                        label: "Field 3",
                        id: "MC3"
                    },
                    {
                        label: "Field 4",
                        id: "MC4"
                    },
                    {
                        label: "Arch Design",
                        id: "MC5"
                    },
                    {
                        label: "Cabinet Design",
                        id: "MC6"
                    },
                    {
                        label: "Interior Design",
                        id: "MC7"
                    }
                ]
            },
            categories: [
                {
                    category: [
                        {
                            start: "04/02/2018 00:00:00",
                            end: "04/02/2018 23:59:59",
                            label: "Monday"
                        },
                        {
                            start: "04/03/2018 00:00:00",
                            end: "04/03/2018 23:59:59",
                            label: "Tuesday"
                        },
                        {
                            start: "04/04/2018 00:00:00",
                            end: "04/04/2018 23:59:59",
                            label: "Wednesday"
                        },
                        {
                            start: "04/05/2018 00:00:00",
                            end: "04/05/2018 23:59:59",
                            label: "Thursday"
                        },
                        {
                            start: "04/06/2018 00:00:00",
                            end: "04/06/2018 23:59:59",
                            label: "Friday"
                        }
                    ]
                }
            ]
        };


        FusionCharts.ready(function () {
            var myChart = new FusionCharts({
                type: "gantt",
                renderAt: "chart-container",
                width: "100%",
                dataFormat: "json",
                dataSource
            }).render();
        });
    }
}