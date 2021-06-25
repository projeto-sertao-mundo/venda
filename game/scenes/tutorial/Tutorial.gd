extends Node2D

onready var tutorial_manager = get_node("/root/TutorialManager")
onready var modal_ask = get_node("ModalAsk")
onready var modal_confirm = get_node("ModalConfirm")

onready var step_intro = get_node("StepIntro")
onready var step_list_click = get_node("StepListClick")
onready var step_list_info = get_node("StepListInfo")
onready var step_list_close = get_node("StepListClose")
onready var step_item_first = get_node("StepitemFirst")

func _ready():
	hidden_all_modals()
	hidden_all_steps()
	var tutorial_status = tutorial_manager.get_tutorial_status()
	if tutorial_status == false:
		visible = true
		tutorial_manager.register_controller(self)
		open_ask_modal()

# GERENCIAR MODAIS
####################

func hidden_all_modals():
	modal_ask.visible = false
	modal_confirm.visible = false

func open_ask_modal():
	modal_ask.visible = true
	modal_ask.modulate = Color(1, 1, 1, 0)
	modal_ask.get_node("ModalBounce").play("Bounce")

func close_ask_modal():
	modal_ask.get_node("ModalBounceOut").play("BounceOut")
	yield(get_tree().create_timer(1.0), "timeout")
	modal_ask.visible = false

func open_confirm_modal():
	modal_confirm.visible = true
	modal_confirm.modulate = Color(1, 1, 1, 0)
	modal_confirm.get_node("ModalBounce").play("Bounce")

func close_confirm_modal():
	modal_confirm.get_node("ModalBounceOut").play("BounceOut")
	yield(get_tree().create_timer(1.0), "timeout")
	modal_confirm.visible = false

# EVENTOS DOS MODAIS
####################

func _on_click_confirm_ask_modal(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			close_ask_modal()
			yield(get_tree().create_timer(1.0), "timeout")
			tutorial_manager.start_tutorial()

func _on_click_cancel_aks_modal(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			close_ask_modal()
			yield(get_tree().create_timer(1.0), "timeout")
			open_confirm_modal()

func _on_click_confirm_confirm_modal(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			close_confirm_modal()
			tutorial_manager.skip_tutorial()

func _on_click_cancel_confirm_modal(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			close_confirm_modal()
			yield(get_tree().create_timer(1.0), "timeout")
			open_ask_modal()

# TUTORIAL
####################

func hidden_all_steps():
	step_intro.visible = false
	step_list_click.visible = false
	step_list_info.visible = false
	step_list_close.visible = false
	step_item_first.visible = false

func show_intro_step():
	step_intro.visible = true

func show_list_click_step(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			step_intro.visible = false
			step_list_click.visible = true
			tutorial_manager.enable_list_button()

func show_list_info_step():
	step_list_click.visible = false
	step_list_info.visible = true

func show_list_close_step(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			step_list_info.visible = false
			step_list_close.visible = true
			tutorial_manager.enable_list_close()

func close_list_close_step():
	step_list_close.visible = false

func show_item_first_step():
	step_item_first.visible = true
