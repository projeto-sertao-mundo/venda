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
var close_inventory_is_enable = false


var helper_is_enable = false
var found_items_is_enable = false

func register_controller(tutorial: Node2D):
	tutorial_controller = tutorial

func get_tutorial_status():
	return tutorial_is_completed

func skip_tutorial():
	tutorial_is_completed = true
	tutorial_is_running = false
	enable_all_buttons()
	enable_list_close()
	enable_found_items()
	enable_helper()

func start_tutorial():
	tutorial_is_running = true
	show_step()

# BUTTONS
###############

func disable_all_buttons():
	button_exit_is_enable = false
	button_list_is_enable = false
	button_inventory_is_enable = false

func enable_all_buttons():
	button_exit_is_enable = true
	button_list_is_enable = true
	button_inventory_is_enable = true

func enable_exit_button():
	disable_all_buttons()
	button_exit_is_enable = true

func enable_list_button():
	disable_all_buttons()
	button_list_is_enable = true

func enable_inventory_button():
	disable_all_buttons()
	button_inventory_is_enable = true

func enable_list_close():
	close_list_is_enable = true

func enable_inventory_close():
	close_inventory_is_enable = true

func enable_helper():
	helper_is_enable = true

func enable_found_items():
	found_items_is_enable = true

func disable_found_items():
	found_items_is_enable = false

# TUTORIAL CONTROLLER
##############################

func show_step():
	tutorial_controller.show_intro_step()

func show_list_info_step():
	tutorial_controller.show_list_info_step()

func close_list_close_step():
	tutorial_controller.close_list_close_step()
	disable_all_buttons()
	enable_found_items()
	enable_list_button()

func show_item_first_step():
	tutorial_controller.show_item_first_step()
	disable_found_items()
	disable_all_buttons()

func show_inventory_item_step():
	tutorial_controller.show_inventory_item_step()

func close_inventory_item_step():
	tutorial_controller.close_inventory_item_step()
	enable_list_button()
	enable_inventory_button()
	enable_inventory_close()

func show_helper_intro_step():
	tutorial_controller.show_helper_intro_step()
	disable_all_buttons()
	disable_found_items()

func close_helper_time_step():
	tutorial_controller.close_helper_time_step()
	disable_all_buttons()
	disable_found_items()
