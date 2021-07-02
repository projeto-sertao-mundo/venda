extends Node2D

onready var intro_manager = get_node("/root/Intro")
onready var mask = get_node("Mask")
onready var animation = get_node("Animation")
onready var animation_player = get_node("Animation/AnimationPlayer")
onready var intro = get_node("Intro")

func _ready():
	visible = true
	if intro_manager.display_whirlwind_animation: play()
	else: hidden_all()

func play():
	mask.visible = true
	animation.visible = true
	hidden_intro()
	animation_player.play("MoveOnMap")
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

func _on_timeout():
	hidden_animation()
	reveal_intro()

func _on_hidden_intro(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			hidden_intro()
