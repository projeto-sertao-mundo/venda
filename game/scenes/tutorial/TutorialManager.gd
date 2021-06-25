extends Node2D

var steps = {
	"INTRO": "INTRO",
	"LIST_CLICK": "LIST_CLICK",
}
var tutorial_is_running = false
var tutorial_is_completed = false
var tutorial_controller = null

var button_exit_is_enable = false
var button_list_is_enable = false
var button_inventory_is_enable = false

var close_list_is_enable = false

func register_controller(tutorial: Node2D):
	tutorial_controller = tutorial

func get_tutorial_status():
	return tutorial_is_completed

func skip_tutorial():
	tutorial_is_completed = true

func start_tutorial():
	tutorial_is_running = true
	show_step()

# BUTTONS
###############

func enable_list_button():
	button_list_is_enable = true

func enable_list_close():
	close_list_is_enable = true

# TUTORIAL CONTROLLER
##############################

func show_step():
	tutorial_controller.show_intro_step()

func show_list_info_step():
	tutorial_controller.show_list_info_step()

func close_list_close_step():
	tutorial_controller.close_list_close_step()
