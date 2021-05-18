extends Node2D

onready var manager = get_node("/root/Manager")
export (String, "Cave", "Church", "Elephant", "Station") var level = ""
var text_scene = preload("res://items/hud/list/Text.tscn")

var list
export (NodePath) var list_path

var popup
export (NodePath) var popup_path
var popup_status = false

func _ready():
	list = get_node(list_path)
	popup = get_node(popup_path)

func toggle_popup(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if popup_status == true:
				popup_status = false
				popup.visible = false
			else:
				clear()
				update()
				popup_status = true
				popup.visible = true

func clear():
	var children = list.get_children()
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
		list.add_child(text)
		pos += 45
