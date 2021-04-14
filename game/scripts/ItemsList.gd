extends Node2D

onready var items_manager = get_node("/root/ItemsManager")

func _ready():
	items_manager.item_list_define(self)
