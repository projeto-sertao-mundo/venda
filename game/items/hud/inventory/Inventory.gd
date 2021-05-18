extends Node2D

onready var manager = get_node("/root/Manager")
export (String, "Cave", "Church", "Elephant", "Station") var level = ""

var inventory_is_visible = false
onready var inventory = get_node("Book")

onready var page_cave = get_node("Book/Pages/PageCave")
onready var cave_items = get_node("Book/Pages/PageCave/Items").get_children()

onready var page_church = get_node("Book/Pages/PageChurch")
onready var church_items = get_node("Book/Pages/PageChurch/Items").get_children()

onready var page_elephant = get_node("Book/Pages/PageElephant")
onready var elephant_items = get_node("Book/Pages/PageElephant/Items").get_children()

onready var page_station = get_node("Book/Pages/PageStation")
onready var station_items = get_node("Book/Pages/PageStation/Items").get_children()

func _ready():
	hidden_inventory()
	hidden_all_pages()
	show_cave_page()

func toggle_popup(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if inventory_is_visible: hidden_inventory()
			else:
				show_inventory()
				update_items(cave_items)

func hidden_inventory():
	inventory.visible = false
	inventory_is_visible = false
	inventory.z_index = 500

func show_inventory():
	inventory.visible = true
	inventory_is_visible = true
	inventory.z_index = 1000

func hidden_all_pages():
	page_cave.visible = false
	page_church.visible = false
	page_elephant.visible = false
	page_station.visible = false

# NOTE: Exibir página do inventário

func show_cave_page():
	hidden_all_pages()
	update_items(cave_items)
	page_cave.visible = true

func show_church_page():
	hidden_all_pages()
	update_items(church_items)
	page_church.visible = true

func show_elephant_page():
	hidden_all_pages()
	update_items(elephant_items)
	page_elephant.visible = true

func show_station_page():
	hidden_all_pages()
	update_items(station_items)
	page_station.visible = true

# NOTE: Atualizar lista de items

func update_items(level_items):
	var items = manager.get_items(level)
	for item in items:
		if item.status == true:
			for node in level_items:
				if item.label == node.name:
					node.get_node("Sprite").visible = true
					node.get_node("Default").visible = false

# NOTE: Eventos de clique nas tags do livro

func _on_click_cave_tag(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			show_cave_page()

func _on_click_church_tag(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			show_church_page()

func _on_click_elephant_tag(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			show_elephant_page()

func _on_click_station_tag(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			show_station_page()
