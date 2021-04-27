extends Area2D

export (String) var scene
export (Texture) var default_sprite = null
export (Texture) var hover_sprite = null

var sprite_node = null

func _ready():
	sprite_node = get_node("SpriteNode")

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene(scene)

func _on_mouse_entered():
	sprite_node.texture = hover_sprite

func _on_mouse_exited():
	sprite_node.texture = default_sprite
