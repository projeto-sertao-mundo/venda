extends Area2D

"""
export (Texture) var sprite_texture = null

func _ready():
	if sprite_texture != null:
		var sprite = find_node("Sprite")
		sprite.texture = sprite_texture
		print("Bolinha")
"""

export var item_name = ""

func _on_item_is_pressed(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			print("CLIQUEI")
		else:
			print("SOLTEI")
			get_node(get_path()).queue_free()
