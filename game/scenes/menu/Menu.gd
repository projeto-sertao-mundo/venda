extends Node2D

func _on_PlayGame_pressed(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://scenes/store-out.tscn")
