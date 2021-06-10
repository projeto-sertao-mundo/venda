extends Node

export (Texture) var sprite_default
export (Texture) var sprite_hover
export var exit_to_map: bool = true

onready var sprite_node = get_node("Sprite")

func _on_click_button(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			if exit_to_map:
				get_tree().change_scene("res://scenes/map/Map.tscn")
			else:
				get_tree().change_scene("res://scenes/store-out.tscn")

func _on_mouse_entered():
	sprite_node.texture = sprite_hover

func _on_mouse_exited():
	sprite_node.texture = sprite_default
