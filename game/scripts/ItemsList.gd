extends Node2D

onready var items_manager = get_node("/root/ItemsManager")

export (String) var level_name = ""

func _ready():
	items_manager.level_define(level_name)
	items_manager.item_list_define(self)
	items_manager.item_list_draw()
