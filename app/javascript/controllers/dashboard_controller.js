import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

    connect() {
        const threeMonthDiv = document.getElementById("three_month_workload")
        const sixMonthDiv = document.getElementById("six_month_workload")
        const nineMonthDiv = document.getElementById("nine_month_workload")
        const twelveMonthDiv = document.getElementById("twelve_month_workload")
        const btn3 = document.getElementById("three_month")
        const btn3_label = document.getElementById('three_month_label')
        const btn6 = document.getElementById("six_month")
        const btn6_label = document.getElementById('six_month_label')

        const btn9 = document.getElementById("nine_month")
        const btn9_label = document.getElementById('nine_month_label')

        const btn12 = document.getElementById("twelve_month")
        const btn12_label = document.getElementById('twelve_month_label')


        btn3.addEventListener("click", function () {
            threeMonthDiv.removeAttribute("hidden")
            sixMonthDiv.setAttribute("hidden", "hidden");
            nineMonthDiv.setAttribute("hidden", "hidden");
            twelveMonthDiv.setAttribute("hidden", "hidden");
            btn3_label.classList.add(('btn-primary'));
            btn6_label.classList.remove('btn-primary');
            btn9_label.classList.remove('btn-primary');
            btn12_label.classList.remove('btn-primary');
        });

        btn6.addEventListener("click", function () {
            sixMonthDiv.removeAttribute("hidden");
            threeMonthDiv.setAttribute("hidden", "hidden");
            nineMonthDiv.setAttribute("hidden", "hidden");
            twelveMonthDiv.setAttribute("hidden", "hidden");
            btn6_label.classList.add(('btn-primary'));
            btn3_label.classList.remove('btn-primary');
            btn9_label.classList.remove('btn-primary');
            btn12_label.classList.remove('btn-primary');
        });
        btn9.addEventListener("click", function () {
            nineMonthDiv.removeAttribute("hidden")
            threeMonthDiv.setAttribute("hidden", "hidden")
            sixMonthDiv.setAttribute("hidden", "hidden")
            twelveMonthDiv.setAttribute("hidden", "hidden")
            btn9_label.classList.add(('btn-primary'));
            btn3_label.classList.remove('btn-primary');
            btn6_label.classList.remove('btn-primary');
            btn12_label.classList.remove('btn-primary');
        });
        btn12.addEventListener("click", function () {
            twelveMonthDiv.removeAttribute("hidden")
            threeMonthDiv.setAttribute("hidden", "hidden")
            sixMonthDiv.setAttribute("hidden", "hidden")
            nineMonthDiv.setAttribute("hidden", "hidden")
            btn12_label.classList.add(('btn-primary'));
            btn3_label.classList.remove('btn-primary');
            btn6_label.classList.remove('btn-primary');
            btn9_label.classList.remove('btn-primary');
        });

        function myFunction(id) {
            let element = document.getElementById(id);
            element.classList.toggle("btn-primary");
        }


    }

}