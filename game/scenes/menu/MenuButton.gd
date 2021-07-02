extends Area2D

export (NodePath) var intro_boy_path = null

var original_scale = Vector2(1, 1)
var hovered_scale = original_scale * 1.06
var clicked_scale = original_scale * 0.9

func _ready():
	if intro_boy_path: get_node(intro_boy_path).visible = false

func _on_mouse_entered():
	scale = hovered_scale

func _on_mouse_exited():
	scale = original_scale

func _on_ButtonPlay_pressed(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			scale = clicked_scale
		elif !event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			scale = hovered_scale
			if intro_boy_path: get_node(intro_boy_path).show_me()

#			get_tree().change_scene("res://scenes/store-out.tscn")
			var animation = get_parent().get_node("AnimationPlayer")
			animation.playback_speed = 1.8
			animation.play_backwards("ShowMenu")
