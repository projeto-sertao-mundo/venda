extends Node2D

func _ready():
	get_node("UFMG/AnimationPlayer").play("FadeIn")

func _on_timeout():
	get_tree().change_scene("res://scenes/menu/Menu.tscn")
