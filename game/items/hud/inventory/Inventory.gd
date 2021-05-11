extends Node2D

var popup_status = false
var popup_node
export (NodePath) var popup_path

var sprite_node
export (NodePath) var sprite_path

var cave_page_node
export (NodePath) var cave_page_path

export (Texture) var cave_sprite
export (Texture) var church_sprite
export (Texture) var elephant_sprite
export (Texture) var station_sprite

func _ready():
	popup_node = get_node(popup_path)
	sprite_node = get_node(sprite_path)
	cave_page_node = get_node(cave_page_path)
	
	hidden_all_pages()
	cave_page_node.visible = true
	sprite_node.texture = cave_sprite

func toggle_popup(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if popup_status == true:
				popup_status = false
				popup_node.visible = false
			else:
				popup_status = true
				popup_node.visible = true
				cave_page_node.draw_items()
				
func hidden_all_pages():
	cave_page_node.visible = false

func show_cave_page(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			hidden_all_pages()
			cave_page_node.visible = true
			sprite_node.texture = cave_sprite

func show_church_page(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			hidden_all_pages()
			sprite_node.texture = church_sprite

func show_elephant_page(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			hidden_all_pages()
			sprite_node.texture = elephant_sprite

func show_station_page(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			hidden_all_pages()
			sprite_node.texture = station_sprite
