extends Node2D

onready var intro_manager = get_node("/root/Intro")
onready var animation = get_node("AnimationPlayer")

var animation_time_ref = 0
var animation_time_max = 0
var animation_words_per_secound = 16
var animation_is_running = false
onready var animation_text_label = get_node("Balon/RichTextLabel")

func _ready():
	animation_time_max = 1.0 / animation_words_per_secound
	if intro_manager.display_boy_outside == false:
		visible = false
		
func _process(delta):
	if animation_is_running:
		animation_time_ref += delta
		if animation_time_ref >= animation_time_max:
			animation_time_ref = 0
			animation_text_label.visible_characters += 1
			if animation_text_label.percent_visible == 1:
				animation_is_running = false

func show_me():
	if intro_manager.display_boy_outside == true:
		visible = true
		animation.play("FadeIn")

func _on_end_animation(anim_name: String):
	animation_text_label.visible_characters = 0 
	animation_is_running = true
