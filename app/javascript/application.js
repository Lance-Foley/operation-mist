// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//
import {Turbo} from "@hotwired/turbo-rails"

Turbo.session.drive = true
import "controllers"
import "chartkick"
import Highcharts from "highcharts"
import high_gantt from "highcharts-gantt"


window.Highcharts = Highcharts
window.Highgantt = high_gantt
