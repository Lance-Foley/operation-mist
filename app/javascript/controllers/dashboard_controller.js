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


    }
}