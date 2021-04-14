extends Area2D

export (String) var item_name = ""
export (String) var item_level = ""
export (Texture) var item_sprite = null
export (Texture) var item_sprite_checked = null

onready var items_manager = get_node("/root/ItemsManager")

func _ready():
	items_manager.item_add(item_name, item_level, item_sprite, item_sprite_checked)

func _on_item_is_pressed(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_node(get_path()).queue_free() # Deletar item clicado
			items_manager.item_found(item_name)
