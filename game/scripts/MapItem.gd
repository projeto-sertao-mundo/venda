extends Area2D

onready var manager = get_node("/root/Manager")
export (String, "Cave", "Church", "Elephant", "Station") var level = ""

export (String) var scene
export (Texture) var default_sprite = null
export (Texture) var hover_sprite = null
export (Texture) var completed_sprite = null

var sprite_node = null
var plate_node = null
var level_is_completed = false

func _ready():
	sprite_node = get_node("SpriteNode")
	plate_node = get_node("Plate")
	if level:
		level_is_completed = manager.get_level_status(level)
		if level_is_completed:
			sprite_node.texture = completed_sprite

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT && level_is_completed == false:
			get_tree().change_scene(scene)

func _on_mouse_entered():
	if level_is_completed == false:
		sprite_node.texture = hover_sprite
		if plate_node: plate_node.start_move()

func _on_mouse_exited():
	if level_is_completed == false:
		sprite_node.texture = default_sprite
		if plate_node: plate_node.stop_move()
