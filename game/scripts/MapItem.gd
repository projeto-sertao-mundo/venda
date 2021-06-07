extends Area2D

onready var manager = get_node("/root/Manager")
export (String, "Cave", "Church", "Elephant", "Station") var level = ""

export (String) var scene
export (Texture) var default_sprite = null
export (Texture) var hover_sprite = null

var sprite_node = null
var level_is_completed = false

func _ready():
	sprite_node = get_node("SpriteNode")
	if level: level_is_completed = manager.get_level_status(level)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.get_button_index() == BUTTON_LEFT && level_is_completed == false:
			get_tree().change_scene(scene)

func _on_mouse_entered():
	if level_is_completed == false:
		sprite_node.texture = hover_sprite

func _on_mouse_exited():
	if level_is_completed == false:
		sprite_node.texture = default_sprite
