extends Node2D

var credits = null
var credits_animation = null

func _ready():
	var animation = get_node("AnimationPlayer")
	animation.play("ShowMenu")
	credits = get_node("Credits")
	credits_animation = get_node("Credits/Sprite/AnimationPlayer")
	credits.visible = false

func _on_show_credits(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			credits.visible = true
			credits_animation.play("Show")

func _on_hidden_credits(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			credits.visible = false
