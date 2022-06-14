// Import and register all your controllers from the importmap under controllers/*
// Eager load all controllers defined in the import map under controllers/**/*_controller
import {application} from "controllers/application"
import {eagerLoadControllersFrom} from "@hotwired/stimulus-loading"
// import hello_controller from "./hello_controller";
// import schedule_controller from "./schedule_controller";
//
// application.register("hello", hello_controller)
//
// application.register("schedule", schedule_controller)n} from "controllers/application"
eagerLoadControllersFrom("controllers", application)