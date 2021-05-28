extends Node2D

onready var manager = get_node("/root/Manager")

func _ready():
	if manager.should_run_map_animation:
		var animation = get_node("AnimationPlayer")
		animation.play("MoveOnMap")
		manager.should_run_map_animation = false
	else:
		var whirlwind = get_node(".")
		whirlwind.visible = false
