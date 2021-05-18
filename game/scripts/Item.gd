extends Area2D

onready var manager = get_node("/root/Manager")
export (String, "Cave", "Church", "Elephant", "Station") var level = ""
export (String) var item_name = ""

func _on_item_is_pressed(vi1ewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			founded()

func founded():
	manager.item_found(level, item_name)
	delete_me()

func delete_me():
	get_node(get_path()).queue_free()
