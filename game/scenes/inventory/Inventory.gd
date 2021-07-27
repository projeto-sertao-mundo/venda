extends Node2D

onready var manager = get_node("/root/Manager")
onready var tutorial_manager = get_node("/root/TutorialManager")
export (String, "Cave", "Church", "Elephant", "Station") var level = ""

export (Texture) var sprite_default
export (Texture) var sprite_hover

onready var sprite_node = get_node("Icon/Book")

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

onready var information_modal = get_node("InformationModal")

var first_inventory_close = true
var first_inventory_visit = true
var first_information_modal_visit = true

func _ready():
	visible = true
	hidden_inventory()
	hidden_all_pages()
	hidden_information_modal()
	show_page()

func toggle_popup(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			if tutorial_manager.tutorial_is_running: toggle_popup_inside_tutorial()
			else: toggle_popup_outside_tutorial()

func toggle_popup_outside_tutorial():
	if inventory_is_visible: hidden_inventory()
	else: show_inventory()

func toggle_popup_inside_tutorial():
	if tutorial_manager.button_inventory_is_enable == true:
		if inventory_is_visible && tutorial_manager.close_inventory_is_enable:
			hidden_inventory()
			if first_inventory_close:
				first_inventory_close = false
				tutorial_manager.show_helper_intro_step()
		else:
			show_inventory()
			if first_inventory_visit:
				first_inventory_visit = false
				tutorial_manager.show_inventory_item_step()

# NOTE: Controlar exibição da páginas do inventário

func play_sound_effect():
	var audio = get_node("AudioStreamPlayer")
	if audio.playing == false: audio.play()

func show_inventory():
	inventory.visible = true
	inventory_is_visible = true
	inventory.z_index = 1000
	show_page()

func show_page():
	if level == "Cave": show_cave_page()
	elif level == "Church": show_church_page()
	elif level == "Station": show_station_page()
	else: show_elephant_page()

func show_cave_page():
	hidden_all_pages()
	var manager_items = manager.get_items("Cave")
	update_items(manager_items, cave_items)
	page_cave.visible = true

func show_church_page():
	hidden_all_pages()
	var manager_items = manager.get_items("Church")
	update_items(manager_items, church_items)
	page_church.visible = true

func show_elephant_page():
	hidden_all_pages()
	var manager_items = manager.get_items("Elephant")
	update_items(manager_items, elephant_items)
	page_elephant.visible = true

func show_station_page():
	hidden_all_pages()
	var manager_items = manager.get_items("Station")
	update_items(manager_items, station_items)
	page_station.visible = true

func show_information_modal():
	information_modal.visible = true
	information_modal.z_index = 2000
	if first_information_modal_visit && tutorial_manager.tutorial_is_running:
		first_information_modal_visit = false
		tutorial_manager.close_inventory_item_step()

func hidden_information_modal():
	information_modal.visible = false

func hidden_inventory():
	inventory.visible = false
	inventory_is_visible = false
	inventory.z_index = 500

func hidden_all_pages():
	page_cave.visible = false
	page_church.visible = false
	page_elephant.visible = false
	page_station.visible = false

# NOTE: Atualizar lista de items

func update_items(manager_items, level_items):
	for item in manager_items:
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
			play_sound_effect()

func _on_click_church_tag(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			show_church_page()
			play_sound_effect()

func _on_click_elephant_tag(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			show_elephant_page()
			play_sound_effect()

func _on_click_station_tag(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			show_station_page()
			play_sound_effect()

func _on_click_open_information_modal(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			show_information_modal()

func _on_click_close_information_modal(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			hidden_information_modal()

func _on_mouse_entered():
	if tutorial_manager.button_inventory_is_enable == true:
		sprite_node.texture = sprite_hover

func _on_mouse_exited():
	if tutorial_manager.button_inventory_is_enable == true:
		sprite_node.texture = sprite_default


func _on_click_item(event):
	pass # Replace with function body.
