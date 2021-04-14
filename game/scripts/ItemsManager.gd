extends Node2D

export (Array, Dictionary) var items = []
export (int) var sprite_scale = 4
export (int) var sprite_margin = 30

var item_list = null

func item_add(name: String, level: String, sprite: Texture, sprite_checked: Texture):
	var hasItem = false
	for item in items:
		if item.name == name:
			hasItem = true
			break
	if hasItem == false:
		items.push_front({
			name = name,
			level = level,
			sprite = sprite,
			sprite_checked = sprite_checked,
			status = false,
		})
		item_list_draw()

func item_found(name: String):
	for item in items:
		if item.name == name:
			item["status"] = true
	item_list_draw()

func check_complete_level():
	var hasNotFoundItem = false
	for item in items:
		if item.status == false:
			hasNotFoundItem = true
			break
	if hasNotFoundItem == false:
		var scene = load("res://modals/CompleteLevel.tscn")
		var modal = scene.instance()
		get_parent().add_child(modal)

func create_sprite(sprite_txt: Texture, sprite_checked_txt: Texture, status: bool):
	var sprite = Sprite.new()
	sprite.scale = Vector2(sprite_scale, sprite_scale)
	if status == true:
		sprite.texture = sprite_checked_txt
	else:
		sprite.texture = sprite_txt
	return sprite

func item_list_define(node: Node2D):
	item_list = node

func item_list_clear():
	var item_list_children = item_list.get_children()
	for item in item_list_children: # Limpar lista de items
		item.free()

func item_list_populate():
	var i = 0
	while i < items.size(): # Adicionar novos sprites
		var item = items[i]
		var sprite = create_sprite(item.sprite, item.sprite_checked, item.status)
		var size = sprite.get_rect().size
		var positionX = (i * size.x * sprite_scale) + (i * sprite_margin)
		sprite.position.x = positionX
		item_list.add_child(sprite)
		i += 1

func item_list_fix_position():
	var item_list_children = item_list.get_children()
	var item_list_count = item_list_children.size()
	var sprite_size = item_list_children[0].get_rect().size
	var positionX = (item_list_count * sprite_size.x * sprite_scale) + (item_list_count * sprite_margin)
	item_list.position.x = (1920 - positionX) / 2
	item_list.position.y = 980

func item_list_draw():
	item_list_clear()
	item_list_populate()
	item_list_fix_position()
	check_complete_level()
	pass
