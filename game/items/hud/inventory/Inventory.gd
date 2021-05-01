extends Node2D

export (NodePath) var popup_path
export (NodePath) var popup_closer_path

var popup_node
var popup_closer_node

func _ready():
	popup_node = get_node(popup_path)
	popup_closer_node = get_node(popup_closer_path)

func open_popup(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			popup_node.visible = true
			popup_closer_node.visible = true

func close_popup(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			popup_node.visible = false
			popup_closer_node.visible = false
