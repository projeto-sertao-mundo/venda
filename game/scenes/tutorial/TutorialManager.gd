extends Node2D

var tutorial_completed = false

func get_tutorial_status():
	return tutorial_completed

func skip_tutorial():
	tutorial_completed = true
