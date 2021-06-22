extends Node2D

func _ready():
	visible = true
	var animation = get_node("ColorRect/AnimationPlayer")
	animation.play("FadeIn")

func _on_timeout():
	get_node(".").visible = false
