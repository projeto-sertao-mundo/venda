extends KinematicBody2D

onready var manager = get_node("/root/Manager")
onready var tutorial_manager = get_node("/root/TutorialManager")
export (String, "Cave", "Church", "Elephant", "Station") var level = ""
export (String) var item_name = ""

var is_revealed = false
var bounce_scale = 0.01
var bounce_time  = 0

var is_founded = false
var target = Vector2(1220, 670)
var velocity = Vector2()
var speed = 500

func _ready():
	var status = manager.check_item(level, item_name)
	if status: delete_me()

func founded():
	manager.item_found(level, item_name)
	z_index = 256
	is_founded = true
	is_revealed = false
	check_level()

func delete_me():
	get_node(get_path()).queue_free()

func reveal_me():
	z_index = 2000
	is_revealed = true

func check_level():
	var status = manager.get_level_status(level)
	if status:
		var modal = load("res://scenes/completed/CompletedModal.tscn")
		get_node("/root").add_child(modal.instance())

func _physics_process(delta):
	velocity = position.direction_to(target) * speed

	if is_founded && position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
	elif is_founded:
		delete_me()

	if is_revealed:
		bounce_time += delta
		scale += Vector2(bounce_scale, bounce_scale)
		if bounce_time >= 1:
			bounce_time = 0
			bounce_scale *= -1


# TODO: Atualizar o nome desse method para _on_click_item
func _on_item_is_pressed(vi1ewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			if tutorial_manager.found_items_is_enable:
				founded()
