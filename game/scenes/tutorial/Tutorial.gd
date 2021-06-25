extends Node2D

onready var tutorial_manager = get_node("/root/TutorialManager")
onready var modal_ask = get_node("ModalAsk")
onready var modal_confirm = get_node("ModalConfirm")

func _ready():
	modal_ask.visible = false
	modal_confirm.visible = false
	var tutorial_status = tutorial_manager.get_tutorial_status()
	if tutorial_status == false:
		visible = true
		open_ask_modal()

# EVENTOS DOS MODAIS
####################

func _on_click_confirm_ask_modal(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			close_ask_modal()
			start_tutorial()

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
			skip_tutorial()

func _on_click_cancel_confirm_modal(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			close_confirm_modal()
			yield(get_tree().create_timer(1.0), "timeout")
			open_ask_modal()

# GERENCIAR MODAIS
####################

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

# TUTORIAL
####################

func skip_tutorial():
	tutorial_manager.skip_tutorial()

func start_tutorial():
	pass
