# Pin npm packages by running ./bin/importmap

pin "application", preload: true

pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "chartkick", to: "chartkick.js"
pin "highcharts", to: "https://ga.jspm.io/npm:highcharts@10.1.0/highcharts.js"
pin "highcharts-gantt", to: "https://ga.jspm.io/npm:highcharts-gantt@0.1.7/gantt.js"

pin "popper", to: 'popper.js'
pin "bootstrap", to: 'bootstrap.min.js'

# pin "highcharts" # @10.1.0
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "fusioncharts", to: "https://ga.jspm.io/npm:fusioncharts@3.18.0/fusioncharts.js"
