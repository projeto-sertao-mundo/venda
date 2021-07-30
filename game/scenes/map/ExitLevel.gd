extends Node

onready var audio_manager = get_node("/root/AudioManager")
onready var tutorial_manager = get_node("/root/TutorialManager")

export (Texture) var sprite_default
export (Texture) var sprite_hover
export var exit_to_map: bool = true

onready var sprite_node = get_node("Sprite")

func _on_click_button(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			if tutorial_manager.button_exit_is_enable == true:
				audio_manager.play_button_back()
				if exit_to_map:
					get_tree().change_scene("res://scenes/map/Map.tscn")
				else:
					get_tree().change_scene("res://scenes/menu/Menu.tscn")

func _on_mouse_entered():
	if tutorial_manager.button_exit_is_enable == true:
		sprite_node.texture = sprite_hover

func _on_mouse_exited():
	if tutorial_manager.button_exit_is_enable == true:
		sprite_node.texture = sprite_default
