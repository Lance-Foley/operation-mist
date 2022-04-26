# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "chartkick", to: "chartkick.js"

pin "highcharts", to: "https://ga.jspm.io/npm:highcharts@10.0.0/highcharts.js"
pin "popper", to: 'popper.js', preload: true
pin "bootstrap", to: 'bootstrap.min.js', preload: true