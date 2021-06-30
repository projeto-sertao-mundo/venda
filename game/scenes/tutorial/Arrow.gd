extends Node2D

func _ready():
	var anim = get_node("Sprite/AnimationPlayer")
	anim.play("Move")
