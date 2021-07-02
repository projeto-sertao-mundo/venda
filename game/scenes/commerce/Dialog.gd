extends Node2D

onready var item_manager = get_node("/root/Manager")
onready var complete_dialog = get_node("Complete")
onready var incomplete_dialog = get_node("Incomplete")

func _ready():
	hidden_all()
	show_dialog()

func show_dialog():
	var status = item_manager.check_game()
	if status: show_complete_dialog()
	elif status == false: show_incomplete_dialog()

func show_complete_dialog():
	complete_dialog.visible = true

func show_incomplete_dialog():
	incomplete_dialog.visible = true

func hidden_all():
	visible = true
	hidden_complete_dialog()
	hidden_incomplete_dialog()

func hidden_complete_dialog():
	complete_dialog.visible = false

func hidden_incomplete_dialog():
	incomplete_dialog.visible = false

func _on_hidden_complete_dialog(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			hidden_complete_dialog()

func _on_hidden_incomplete_dialog(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			hidden_incomplete_dialog()
