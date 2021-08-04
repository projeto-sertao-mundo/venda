extends Node2D

var complete_dialog_step = 1

onready var item_manager = get_node("/root/Manager")
onready var music_manager = get_node("/root/Music")
onready var intro_manager = get_node("/root/Intro")
onready var tutorial_manager = get_node("/root/TutorialManager")
onready var complete_dialog = get_node("Complete")
onready var incomplete_dialog = get_node("Incomplete")

onready var complete_dialog_msg_01 = get_node("Complete/RichTextLabel")

var animation_time_ref = 0
var animation_time_max = 0
var animation_words_per_secound = 40
var animation_is_running = false
onready var text_label = null

func _ready():
	animation_time_max = 1.0 / animation_words_per_secound
	hidden_all()
	show_dialog()
	
func _process(delta):
	if animation_is_running:
		animation_time_ref += delta
		if animation_time_ref >= animation_time_max:
			animation_time_ref = 0
			text_label.visible_characters += 1
			if text_label.percent_visible == 1:
				animation_is_running = false

func start_text_label_animation(label):
	animation_time_ref = 0
	animation_is_running = true
	text_label = label
	text_label.visible_characters = 0
	
func end_text_label_animaiton():
	animation_time_ref = 0
	animation_is_running = false
	text_label.percent_visible = 1

func show_dialog():
	var status = item_manager.check_game()
	if status: show_complete_dialog()
	else: show_incomplete_dialog()

func show_complete_dialog():
	complete_dialog.visible = true
	var label = complete_dialog.get_node("RichTextLabel")
	start_text_label_animation(label)

func show_incomplete_dialog():
	incomplete_dialog.visible = true
	var label = incomplete_dialog.get_node("RichTextLabel")
	start_text_label_animation(label)

func hidden_all():
	visible = true
	hidden_complete_dialog()
	hidden_incomplete_dialog()

func hidden_complete_dialog():
	complete_dialog.visible = false

func hidden_incomplete_dialog():
	incomplete_dialog.visible = false

func _on_hidden_complete_dialog(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			if animation_is_running: end_text_label_animaiton()
			else: 
				hidden_complete_dialog()
#				reset_game()

func _on_hidden_incomplete_dialog(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			if animation_is_running: end_text_label_animaiton()
			else: hidden_incomplete_dialog()

func reset_game():
	intro_manager.reset_game()
	item_manager.reset_game()
	tutorial_manager.reset_game()
	music_manager.disable_all()
	get_tree().change_scene("res://scenes/menu/Menu.tscn")
