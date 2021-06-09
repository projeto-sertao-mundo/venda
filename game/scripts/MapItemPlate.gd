extends KinematicBody2D

var bounce_scale = 0.04
var bounce_time  = 0

func _physics_process(delta):
	if visible:
		bounce_time += delta
		if scale.x <= 0.6: scale += Vector2(bounce_scale, bounce_scale)
		position = get_global_mouse_position() - get_parent().position
		position.y += 50


func start_move():
	visible = true
	scale = Vector2(0, 0)

func stop_move():
	visible = false
