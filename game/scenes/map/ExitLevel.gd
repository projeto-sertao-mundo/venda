extends Node

export (Texture) var sprite_default
export (Texture) var sprite_hover

onready var sprite_node = get_node("Sprite")

func _on_click_button(event: InputEvent):
	if event is InputEventMouseButton:
		print("ENTREI de novo")
		if event.is_pressed():
			get_tree().change_scene("res://scenes/map/Map.tscn")

func _on_mouse_entered():
	sprite_node.texture = sprite_hover

func _on_mouse_exited():
	sprite_node.texture = sprite_default
