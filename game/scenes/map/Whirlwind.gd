extends Node2D

onready var manager = get_node("/root/Manager")

func _ready():
	if manager.should_run_map_animation:
		var animation = get_node("AnimationPlayer")
		animation.play("MoveOnMap")
		manager.should_run_map_animation = false
	else:
		hidden_items()

func hidden_items():
	var whirlwind = get_node(".")
	var whirlwind_mask = get_parent().get_node("WhirlwindMask")
	whirlwind.visible = false
	whirlwind_mask.visible = false

func _on_timeout():
	hidden_items()
