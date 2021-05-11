extends Node2D

onready var manager = get_node("/root/ItemsManager")
var items
var sprites;

func _ready():
	items = manager.get_list("Cave")
	sprites = get_children()
	draw_items()
	
func draw_items():
	var index = 0
	for item in items:
		if item.status:
			sprites[index].texture = item.sprite
		index += 1

