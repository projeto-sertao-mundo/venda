extends Node2D

export (Array, Dictionary) var items = []
export (int) var sprite_scale = 4
export (int) var sprite_margin = 30

func _ready():
	draw_item_list()

func add_item(name: String, sprite: Texture, sprite_checked: Texture):
	items.push_front({
		name = name,
		sprite = sprite,
		sprite_checked = sprite_checked,
		status = false,
	})

func item_found(name: String):
	for item in items:
		if item.name == name:
			item["status"] = true
	draw_item_list()

func create_item_sprite(item: Dictionary):
	var sprite = Sprite.new()
	sprite.scale = Vector2(sprite_scale, sprite_scale)
	if item.status == true:
		sprite.texture = item.sprite_checked
	else:
		sprite.texture = item.sprite
	return sprite

func populate_item_list():
	var item_list_node = get_node("items-to-find")
	var i = 0
	while i < items.size(): # Adicionar novos sprites
		var sprite = create_item_sprite(items[i])
		var size = sprite.get_rect().size
		var positionX = (i * size.x * sprite_scale) + (i * sprite_margin)
		sprite.position.x = positionX
		item_list_node.add_child(sprite)
		i += 1

func clear_item_list():
	var item_list_node = get_node("items-to-find")
	var item_list_children = item_list_node.get_children()
	for item in item_list_children: # Limpar lista de items
		item.free()

func fix_position_item_list():
	var item_list_node = get_node("items-to-find")
	var item_list_children = item_list_node.get_children()
	var item_list_count = item_list_children.size()
	var sprite_size = item_list_children[1].get_rect().size
	var positionX = (item_list_count * sprite_size.x * sprite_scale) + (item_list_count * sprite_margin)
	item_list_node.position.x = (1920 - positionX) / 2

func draw_item_list():
	clear_item_list()
	populate_item_list()
	fix_position_item_list()
