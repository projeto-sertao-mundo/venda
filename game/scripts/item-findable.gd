extends Area2D

export var item_name = ""

func _on_item_is_pressed(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			print("CLIQUEI no: " + item_name)
			get_node(get_path()).queue_free()
