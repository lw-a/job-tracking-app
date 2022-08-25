// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"
import Chart from 'stimulus-chartjs'

application.register('chart', Chart)

import EditNotesController from "./edit_notes_controller"
application.register("edit-notes", EditNotesController)

import AddTaskController from "./add_task_controller"
application.register("add-task", AddTaskController)

import DoneTaskController from "./done_task_controller"
application.register("done-task", DoneTaskController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ChartController from "./chart_controller"
application.register("chart", ChartController)
