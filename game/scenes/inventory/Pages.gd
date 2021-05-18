extends Node2D

onready var manager = get_node("/root/Manager")
export (String, "Cave", "Church", "Elephant", "Station") var level = ""

var items
var sprites;

func _ready():
#	items = manager.get_items(level)
	sprites = get_children()
#	draw_items()
	pass

func draw_items():
	var index = 0
	for item in items:
		if item.status: sprites[index].texture = item.sprite
		index += 1

