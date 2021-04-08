extends Area2D

export (String) var item_name = ""
export (Texture) var item_sprite = null
export (Texture) var item_sprite_checked = null

func _ready():
	add_item()

func add_item():
	var parent = get_parent()
	parent.add_item(item_name, item_sprite, item_sprite_checked)

func remove_item():
	get_node(get_path()).queue_free() # Deletar item clicado
	var parent = get_parent()
	parent.item_found(item_name)

func _on_item_is_pressed(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			remove_item()
