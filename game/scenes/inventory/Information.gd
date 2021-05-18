extends Node2D

var popup_detail
export (NodePath) var popup_detail_path

func _ready():
	popup_detail = get_node(popup_detail_path)

func open_information_modal(viewport, event, shape_idx):
	print("open")
	if event is InputEventMouseButton:
		if event.is_pressed():
			popup_detail.visible = true
			print("open open")

func close_information_modal(viewport, event, shape_idx):
	print("close")
	if event is InputEventMouseButton:
		if event.is_pressed():
			popup_detail.visible = false
			print("close close")
