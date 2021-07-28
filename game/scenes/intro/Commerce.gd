extends Node2D

onready var intro_manager = get_node("/root/Intro")

var actual_step = 0
var is_enable_change_step = true

onready var boy = get_node("Steps/Boy")
onready var man = get_node("Steps/Man")
onready var balon = get_node("Steps/BalonBig")

onready var step_bg = get_node("Steps/BG")
onready var step_01 = get_node("Steps/01")
onready var step_02 = get_node("Steps/02")
onready var step_03 = get_node("Steps/03")
onready var step_04 = get_node("Steps/04")
onready var step_05 = get_node("Steps/05")
onready var step_06 = get_node("Steps/06")
onready var step_07 = get_node("Steps/07")
onready var step_08 = get_node("Steps/08")
onready var step_09 = get_node("Steps/09")
onready var step_10 = get_node("Steps/10")
onready var step_11 = get_node("Steps/11")
onready var step_12 = get_node("Steps/12")

onready var timer = get_node("Steps/Timer")

func _ready():
	intro_manager.hidden_boy_outside()
	hidden_all_steps()
	next_step()

func _on_timeout_enable_change_step():
	enable_change_step()

func enable_change_step():
	is_enable_change_step = true

func disable_change_step():
	is_enable_change_step = false
	timer.start()

func hidden_all_steps():
	boy.visible = false
	man.visible = false
	balon.visible = false
	step_01.visible = false
	step_02.visible = false
	step_03.visible = false
	step_04.visible = false
	step_05.visible = false
	step_06.visible = false
	step_07.visible = false
	step_08.visible = false
	step_09.visible = false
	step_10.visible = false
	step_11.visible = false
	step_12.visible = false

func _on_next_step(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			if is_enable_change_step:
				next_step()

func next_step():
	actual_step += 1
	hidden_all_steps()
	if actual_step == 1: step_01()
	elif actual_step == 2: step_02()
	elif actual_step == 3: step_03()
	elif actual_step == 4: step_04()
	elif actual_step == 5: step_05()
	elif actual_step == 6: step_06()
	elif actual_step == 7: step_07()
	elif actual_step == 8: step_08()
	elif actual_step == 9: step_09()
	elif actual_step == 10: step_10()
	elif actual_step == 11: step_11()
	elif actual_step == 12: step_12()
	elif actual_step == 13: step_13()

func talk_boy():
	boy.visible = true
	man.visible = false
	balon.visible = true
	balon.flip_h = false

func talk_man():
	boy.visible = false
	man.visible = true
	balon.visible = true
	balon.flip_h = true

func step_01():
	disable_change_step()
	talk_boy()
	step_01.visible = true

func step_02():
	disable_change_step()
	talk_man()
	step_02.visible = true

func step_03():
	disable_change_step()
	talk_boy()
	step_03.visible = true

func step_04():
	disable_change_step()
	step_04.visible = true

func step_05():
	disable_change_step()
	talk_boy()
	step_05.visible = true

func step_06():
	step_06.visible = true
	step_bg.visible = false
	get_node("Steps/06/AudioStreamPlayer").play()
	get_node("Steps/06/Timer").start()
	get_node("Steps/06/Whirlwind/AnimationPlayer").play("Whirlwind")

func step_07():
	disable_change_step()
	talk_man()
	step_bg.visible = true
	step_07.visible = true

func step_08():
	disable_change_step()
	talk_man()
	step_08.visible = true

func step_09():
	disable_change_step()
	talk_man()
	step_09.visible = true

func step_10():
	disable_change_step()
	talk_boy()
	step_10.visible = true

func step_11():
	disable_change_step()
	talk_man()
	step_11.visible = true

func step_12():
	disable_change_step()
	talk_man()
	step_12.visible = true

func step_13():
	get_tree().change_scene("res://scenes/map/Map.tscn")
