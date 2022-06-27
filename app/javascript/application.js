// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import Highcharts from "highcharts"
import Highgantt from "highcharts-gantt"

window.Highcharts = Highcharts
window.Highgantt = Highgantt
