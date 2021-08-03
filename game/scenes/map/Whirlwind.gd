extends Node2D

onready var intro_manager = get_node("/root/Intro")
onready var mask = get_node("Mask")
onready var animation = get_node("Animation")
onready var animation_player = get_node("Animation/AnimationPlayer")
onready var intro = get_node("Intro")

var animation_time_ref = 0
var animation_time_max = 0
var animation_words_per_secound = 40
var animation_is_running = false
onready var text_label = get_node("Intro/RichTextLabel")

func _ready():
	visible = true
	animation_time_max = 1.0 / animation_words_per_secound
	if intro_manager.display_whirlwind_animation: play()
	else: hidden_all()
	
func _process(delta):
	if animation_is_running:
		animation_time_ref += delta
		if animation_time_ref >= animation_time_max:
			animation_time_ref = 0
			text_label.visible_characters += 1
			if text_label.percent_visible == 1:
				animation_is_running = false

func play():
	mask.visible = true
	animation.visible = true
	hidden_intro()
	animation_player.play("MoveOnMap")
	get_node("AudioStreamPlayer").play()
	intro_manager.hidden_whirlwind_animation()

func hidden_all():
	visible = false
	hidden_animation()
	hidden_intro()

func hidden_animation():
	mask.visible = false
	animation.visible = false

func hidden_intro():
	intro.visible = false

func reveal_intro():
	intro.visible = true
	text_label.visible_characters = 0
	animation_is_running = true

func _on_timeout():
	hidden_animation()
	reveal_intro()

func _on_hidden_intro(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			hidden_intro()
