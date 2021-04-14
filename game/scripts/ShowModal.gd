extends Node2D

var content = null
var timer = null

func _ready():
	content = get_node("content")
	timer = get_node("timer")
	star_timer()

func star_timer():
	timer.connect("timeout", self, "content_enable")
	timer.set_wait_time(1)
	timer.start()

func content_enable():
	content.visible = true
