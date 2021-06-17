extends Node2D

func _ready():
	var animation = get_node("AnimationPlayer")
	animation.play("ShowMenu")
