extends KinematicBody2D

onready var manager = get_node("/root/Manager")
export (String, "Cave", "Church", "Elephant", "Station") var level = ""
export (String) var item_name = ""

var is_founded = false
var target = Vector2(1220, 670)
var velocity = Vector2()
var speed = 500

# TODO: Atualizar o nome desse method para _on_click_item
func _on_item_is_pressed(vi1ewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			founded()

func founded():
	manager.item_found(level, item_name)
	z_index = 256
	is_founded = true

func delete_me():
	get_node(get_path()).queue_free()

func _physics_process(delta):
	velocity = position.direction_to(target) * speed

	if is_founded && position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
	elif is_founded:
		delete_me()
