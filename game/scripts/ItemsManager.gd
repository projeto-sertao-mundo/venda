extends Node2D

export (Dictionary) var items = {}
export (int) var sprite_scale = 0.3
export (int) var sprite_margin = 30

var item_list = null
var level_name = ""

func define_level(name: String):
	level_name = name
	print(items.has(level_name))
	if items.has(level_name) == false:
		items[level_name] = []

func item_add(name: String, level: String, sprite: Texture, sprite_checked: Texture):
	var hasItem = false
	for item in items[level_name]:
		if item.name == name:
			hasItem = true
			break
	if hasItem == false:
		items[level_name].push_front({
			name = name,
			level = level,
			sprite = sprite,
			sprite_checked = sprite_checked,
			status = false,
		})

func item_found(name: String):
	for item in items[level_name]:
		if item.name == name:
			item["status"] = true

func define_list(node: Node2D):
	item_list = node

func get_list(level: String):
	return items[level]



func item_is_checked(name: String):
	var isChecked = false
	for item in items[level_name]:
		if item.name == name:
			isChecked = item.status
			break
	return isChecked

func check_complete_level():
	var hasNotFoundItem = false
	for item in items[level_name]:
		if item.status == false:
			hasNotFoundItem = true
			break
	if hasNotFoundItem == false and items[level_name].size() > 0:
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

func item_list_clear():
	var item_list_children = item_list.get_children()
	for item in item_list_children: # Limpar lista de items
		item.free()

func item_list_populate():
	var i = 0
	while i < items[level_name].size(): # Adicionar novos sprites
		var item = items[level_name][i]
		var sprite = create_sprite(item.sprite, item.sprite_checked, item.status)
		var size = sprite.get_rect().size
		var positionX = (i * size.x * sprite_scale) + (i * sprite_margin)
		sprite.position.x = positionX
		item_list.add_child(sprite)
		i += 1

func item_list_fix_position():
	var item_list_children = item_list.get_children()
	var item_list_count = item_list_children.size()
	if item_list_count != 0:
		var sprite_size = item_list_children[0].get_rect().size
		var positionX = (item_list_count * sprite_size.x * sprite_scale) + (item_list_count * sprite_margin)
		item_list.position.x = (1920 - positionX) / 2
	item_list.position.y = 980

func item_list_draw():
#	item_list_clear()
#	item_list_populate()
#	item_list_fix_position()
	check_complete_level()
