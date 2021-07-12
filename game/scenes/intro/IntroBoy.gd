extends Node2D

onready var intro_manager = get_node("/root/Intro")

func _ready():
	if intro_manager.display_boy_outside == false:
		visible = false

func show_me():
	if intro_manager.display_boy_outside == true:
		visible = true
