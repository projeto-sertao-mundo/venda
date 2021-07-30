extends Node2D

export (NodePath) var parent

onready var audio_manager = get_node("/root/AudioManager")

var original_scale = Vector2(1, 1)
var hovered_scale = original_scale * 1.1
var clicked_scale = original_scale * 0.9

func _ready():
	get_parent().get_node("AnimationPlayer").play("Bounce")

func _on_mouse_entered():
	scale = hovered_scale

func _on_mouse_exited():
	scale = original_scale

func _on_pressed(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			audio_manager.play_button_confirm()
			scale = clicked_scale
		elif !event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			scale = hovered_scale
			get_tree().change_scene("res://scenes/map/Map.tscn")
			get_node(parent).queue_free()
