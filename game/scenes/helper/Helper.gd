extends Node2D

onready var manager = get_node("/root/Manager")
onready var tutorial_manager = get_node("/root/TutorialManager")
export (String, "Cave", "Church", "Elephant", "Station") var level = ""

var helper_used = 0
var helper_is_active = false

var timer_increment = 10
var timer_count_default = 30
var timer_count = 0

onready var timer_node = get_node("Timer")
onready var timer_label = get_node("Sprite/Label")
onready var audio_effects = get_node("AudioStreamPlayer")

var first_helper_use = true

func _ready():
	start_timer()

func active_helper():
	helper_is_active = false
	helper_used += 1
	reveal_item()
	start_timer()
	if first_helper_use && tutorial_manager.tutorial_is_running:
		first_helper_use = false
		tutorial_manager.close_helper_time_step()

func reveal_item():
	var item_revealed = select_item_to_reveal()
	if item_revealed:
		highlight_item_revealed(item_revealed)

func select_item_to_reveal():
	var items_to_find = [];
	var items_status = manager.get_items(level)
	for item in items_status:
		if item.status == false: items_to_find.push_front(item.label)
	var size = items_to_find.size()
	if size > 0:
		var r = rand_range(0, size) - 1
		return items_to_find[r]
	else:
		return ""

func highlight_item_revealed(item_revealed: String):
	var items_node = get_parent().get_parent().get_node("Items")
	if items_node:
		var items = items_node.get_children()
		for item in items:
			if item_revealed == item.name: item.reveal_me()

func update_timer():
	timer_count -= 1
	if timer_count == 0: stop_timer()
	else: timer_label.text = String(timer_count)

func start_timer():
	if helper_used == 0: timer_count = timer_count_default
	else: timer_count = timer_count_default + (helper_used * timer_increment)
	timer_label.text = String(timer_count)
	timer_node.start()

func stop_timer():
	helper_is_active = true
	timer_label.text = "Pronto"
	get_node("AnimationPlayer").play("Bounce")
	audio_effects.play()
	timer_node.stop()

func _on_timeout():
	update_timer()

func _on_click_helper(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			if helper_is_active && tutorial_manager.helper_is_enable: active_helper()
