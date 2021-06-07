extends Node2D

func _on_PlayGame_pressed(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			get_tree().change_scene("res://scenes/store-out.tscn")
