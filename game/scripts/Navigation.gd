extends Area2D

onready var intro_manager = get_node("/root/Intro")
onready var audio_manager = get_node("/root/AudioManager")

export (String) var scene
export (Texture) var default_sprite = null
export (Texture) var hover_sprite = null
export (bool) var is_fence = false

var sprite_node = null
var plate_node = null

func _ready():
	sprite_node = get_node("SpriteNode")
	if is_fence: scene = "res://scenes/map/Map.tscn"
	elif intro_manager.display_boy_outside: scene = "res://scenes/intro/Commerce.tscn"
	else: scene = "res://scenes/commerce/Outside.tscn"

func _on_input_event(viewport, event, shape_idx):
	if is_fence && intro_manager.display_boy_outside: return
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			audio_manager.play_button_confirm()
			get_tree().change_scene(scene)

func _on_mouse_entered():
	if is_fence && intro_manager.display_boy_outside: return
	sprite_node.texture = hover_sprite

func _on_mouse_exited():
	if is_fence && intro_manager.display_boy_outside: return
	sprite_node.texture = default_sprite
