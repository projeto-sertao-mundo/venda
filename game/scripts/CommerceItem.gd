extends Node

onready var manager = get_node("/root/Manager")
export (String, "Cave", "Church", "Elephant", "Station") var level = ""
export (String) var item_name = ""

func _ready():
	var item_status = manager.check_item(level, item_name)
	if item_status:
		self.visible = true
