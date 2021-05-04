extends Node2D

onready var manager = get_node("/root/ItemsManager")
var text_scene = preload("res://items/hud/list/Text.tscn")

export (String) var level_name = ""
export (NodePath) var list_path
export (NodePath) var popup_path
export (NodePath) var popup_closer_path

var list_node
var popup_node
var popup_closer_node

func _ready():
	manager.define_level(level_name)
	manager.define_list(self)
	list_node = get_node(list_path)
	popup_node = get_node(popup_path)
	popup_closer_node = get_node(popup_closer_path)

func open_popup(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			popup_node.visible = true
			popup_closer_node.visible = true
			draw_list()

func close_popup(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			popup_node.visible = false
			popup_closer_node.visible = false

func draw_list():
	clear_list()
	draw_items()

func clear_list():
	var items = list_node.get_children()
	for item in items:
		item.free()

func draw_items():
	var pos = 0
	var items = manager.get_list(level_name)
	for item in items:
		var text = text_scene.instance()
		text.get_node("Label").text = item.name
		text.position.y = pos
		if(item.status):
			text.get_node("CheckboxChecked").visible = true
		list_node.add_child(text)
		pos += 25
