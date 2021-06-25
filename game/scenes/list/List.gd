extends Node2D

onready var manager = get_node("/root/Manager")
onready var tutorial_manager = get_node("/root/TutorialManager")
export (String, "Cave", "Church", "Elephant", "Station") var level = ""
onready var text_scene = preload("res://scenes/list/Text.tscn")

export (Texture) var sprite_default
export (Texture) var sprite_hover

onready var sprite_node = get_node("Icon/Note")

onready var textarea = get_node("Paper/Text")
export (NodePath) var list_path

var paper_is_visible = false
onready var paper = get_node("Paper")

var first_list_visit = true
var first_list_close = true

func _ready():
	hidden_list()

func toggle_popup(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			if tutorial_manager.button_list_is_enable == true:
				if paper_is_visible == false:
					show_list()
					if first_list_visit:
						first_list_visit = false
						tutorial_manager.show_list_info_step()
				elif tutorial_manager.close_list_is_enable:
					hidden_list()
					if first_list_close:
						first_list_close = false
						tutorial_manager.close_list_close_step()

func show_list():
	clear()
	update()
	paper.visible = true
	paper_is_visible = true
	paper.z_index = 1000

func hidden_list():
	paper.visible = false
	paper_is_visible = false
	paper.z_index = 500

func clear():
	var children = textarea.get_children()
	for node in children:
		node.free()

func update():
	var pos = 0
	var items = manager.get_items(level)
	for item in items:
		var text = text_scene.instance()
		text.get_node("Label").text = item.label
		text.position.y = pos
		if (item.status): text.get_node("CheckboxChecked").visible = true
		textarea.add_child(text)
		pos += 45

func _on_mouse_entered():
	if tutorial_manager.button_list_is_enable == true:
		sprite_node.texture = sprite_hover

func _on_mouse_exited():
	if tutorial_manager.button_list_is_enable == true:
		sprite_node.texture = sprite_default
