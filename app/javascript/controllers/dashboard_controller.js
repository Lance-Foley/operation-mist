import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

    connect() {
        const threeMonthDiv = document.getElementById("three_month_workload")
        const sixMonthDiv = document.getElementById("six_month_workload")
        const nineMonthDiv = document.getElementById("nine_month_workload")
        const twelveMonthDiv = document.getElementById("twelve_month_workload")
        const btn3 = document.getElementById("three_month")
        const btn6 = document.getElementById("six_month")
        const btn9 = document.getElementById("nine_month")
        const btn12 = document.getElementById("twelve_month")

        btn3.addEventListener("click", function () {
            threeMonthDiv.removeAttribute("hidden")
            sixMonthDiv.setAttribute("hidden", "hidden")
            nineMonthDiv.setAttribute("hidden", "hidden")
            twelveMonthDiv.setAttribute("hidden", "hidden")
        });

        btn6.addEventListener("click", function () {
            sixMonthDiv.removeAttribute("hidden")
            threeMonthDiv.setAttribute("hidden", "hidden")
            nineMonthDiv.setAttribute("hidden", "hidden")
            twelveMonthDiv.setAttribute("hidden", "hidden")
        });
        btn9.addEventListener("click", function () {
            nineMonthDiv.removeAttribute("hidden")
            threeMonthDiv.setAttribute("hidden", "hidden")
            sixMonthDiv.setAttribute("hidden", "hidden")
            twelveMonthDiv.setAttribute("hidden", "hidden")
        });
        btn12.addEventListener("click", function () {
            twelveMonthDiv.removeAttribute("hidden")
            threeMonthDiv.setAttribute("hidden", "hidden")
            sixMonthDiv.setAttribute("hidden", "hidden")
            nineMonthDiv.setAttribute("hidden", "hidden")
        });


        const overview = document.getElementById("overview");
        const schedule = document.getElementById("schedule");
        const workload = document.getElementById("workload");
        const all_jobs = document.getElementById("all_jobs");
        const finance = document.getElementById("finance");

        btnOverview.addEventListener("click", function () {
            overview.removeAttribute("hidden")
            schedule.setAttribute("hidden", "hidden")
            workload.setAttribute("hidden", "hidden")
            finance.setAttribute("hidden", "hidden")

        });
        btnSchedule.addEventListener("click", function () {
            schedule.removeAttribute("hidden")
            overview.setAttribute("hidden", "hidden")
            workload.setAttribute("hidden", "hidden")
            finance.setAttribute("hidden", "hidden")
        });

        btnFiance.addEventListener("click", function () {
            finance.removeAttribute("hidden")
            schedule.setAttribute("hidden", "hidden")
            overview.setAttribute("hidden", "hidden")
            workload.setAttribute("hidden", "hidden")
        });
        btnWorkload.addEventListener("click", function () {
            workload.removeAttribute("hidden")
            finance.setAttribute("hidden", "hidden")
            schedule.setAttribute("hidden", "hidden")
            overview.setAttribute("hidden", "hidden")
        });

    }

}