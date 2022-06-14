// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ClientController from "./client_controller.js"
application.register("client", ClientController)

import CrewThreeMonthChartController from "./crewThreeMonthChart_controller.js"
application.register("crewThreeMonthChart", CrewThreeMonthChartController)

import DashboardController from "./dashboard_controller.js"
application.register("dashboard", DashboardController)

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import ScheduleController from "./schedule_controller.js"
application.register("schedule", ScheduleController)

import SearchFormController from "./search_form_controller.js"
application.register("search-form", SearchFormController)
