extends Node2D

onready var audio_manager = get_node("/root/AudioManager")
onready var tutorial_manager = get_node("/root/TutorialManager")
onready var modal_ask = get_node("ModalAsk")
onready var modal_confirm = get_node("ModalConfirm")

onready var step_intro = get_node("StepIntro")
onready var step_list_click = get_node("StepListClick")
onready var step_list_info = get_node("StepListInfo")
onready var step_list_close = get_node("StepListClose")
onready var step_item_first = get_node("StepItemFirst")

onready var step_inventory_click = get_node("StepInventoryClick")
onready var step_inventory_item = get_node("StepInventoryItem")
onready var step_helper_intro = get_node("StepHelperIntro")
onready var step_helper_time = get_node("StepHelperTime")
onready var step_out = get_node("StepOut")

var animation_time_ref = 0
var animation_time_max = 0
var animation_words_per_secound = 20
var animation_is_running = false
var text_label = null

func _ready():
	hidden_all_modals()
	hidden_all_steps()
	animation_time_max = 1.0 / animation_words_per_secound
	var tutorial_status = tutorial_manager.get_tutorial_status()
	if tutorial_status == false:
		visible = true
		tutorial_manager.register_controller(self)
		open_ask_modal()
	
func _process(delta):
	if animation_is_running:
		animation_time_ref += delta
		if animation_time_ref >= animation_time_max:
			animation_time_ref = 0
			text_label.visible_characters += 1
			if text_label.percent_visible == 1:
				animation_is_running = false

func start_text_label_animation(label):
	animation_time_ref = 0
	animation_is_running = true
	text_label = label
	text_label.visible_characters = 0

# GERENCIAR MODAIS
####################

func hidden_all_modals():
	modal_ask.visible = false
	modal_confirm.visible = false

func open_ask_modal():
	modal_ask.visible = true
	modal_ask.modulate = Color(1, 1, 1, 0)
	modal_ask.get_node("ModalBounce").play("Bounce")

func close_ask_modal():
	modal_ask.get_node("ModalBounceOut").play("BounceOut")
	yield(get_tree().create_timer(1.0), "timeout")
	modal_ask.visible = false

func open_confirm_modal():
	modal_confirm.visible = true
	modal_confirm.modulate = Color(1, 1, 1, 0)
	modal_confirm.get_node("ModalBounce").play("Bounce")

func close_confirm_modal():
	modal_confirm.get_node("ModalBounceOut").play("BounceOut")
	yield(get_tree().create_timer(1.0), "timeout")
	modal_confirm.visible = false

# EVENTOS DOS MODAIS
####################

func _on_click_confirm_ask_modal(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			audio_manager.play_button_confirm()
			close_ask_modal()
			yield(get_tree().create_timer(1.0), "timeout")
			tutorial_manager.start_tutorial()

func _on_click_cancel_aks_modal(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			audio_manager.play_button_back()
			close_ask_modal()
			yield(get_tree().create_timer(1.0), "timeout")
			open_confirm_modal()

func _on_click_confirm_confirm_modal(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			audio_manager.play_button_confirm()
			close_confirm_modal()
			tutorial_manager.skip_tutorial()

func _on_click_cancel_confirm_modal(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			audio_manager.play_button_back()
			close_confirm_modal()
			yield(get_tree().create_timer(1.0), "timeout")
			open_ask_modal()

# TUTORIAL
####################

func hidden_all_steps():
	step_intro.visible = false
	step_list_click.visible = false
	step_list_info.visible = false
	step_list_close.visible = false
	step_item_first.visible = false
	step_inventory_click.visible = false
	step_inventory_item.visible = false
	step_helper_intro.visible = false
	step_helper_time.visible = false
	step_out.visible = false

func show_intro_step():
	step_intro.visible = true
	var label = step_intro.get_node("RichTextLabel")
	start_text_label_animation(label)

func show_list_click_step(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			hidden_all_steps()
			step_list_click.visible = true
			tutorial_manager.enable_list_button()
			var label = step_list_click.get_node("RichTextLabel")
			start_text_label_animation(label)

func show_list_info_step():
	hidden_all_steps()
	step_list_info.visible = true
	var label = step_list_info.get_node("RichTextLabel")
	start_text_label_animation(label)

func show_list_close_step(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			hidden_all_steps()
			step_list_close.visible = true
			tutorial_manager.enable_list_close()
			var label = step_list_close.get_node("RichTextLabel")
			start_text_label_animation(label)

func close_list_close_step():
	hidden_all_steps()

func show_item_first_step():
	hidden_all_steps()
	step_item_first.visible = true
	var label = step_item_first.get_node("RichTextLabel")
	start_text_label_animation(label)

func show_inventory_click_step(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			hidden_all_steps()
			step_inventory_click.visible = true
			tutorial_manager.enable_inventory_button()
			var label = step_inventory_click.get_node("RichTextLabel")
			start_text_label_animation(label)

func show_inventory_item_step():
	hidden_all_steps()
	step_inventory_item.visible = true
	var label = step_inventory_item.get_node("RichTextLabel")
	start_text_label_animation(label)

func close_inventory_item_step():
	hidden_all_steps()

func show_helper_intro_step():
	hidden_all_steps()
	step_helper_intro.visible = true
	var label = step_helper_intro.get_node("RichTextLabel")
	start_text_label_animation(label)

func show_helper_time_step(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			hidden_all_steps()
			step_helper_time.visible = true
			tutorial_manager.disable_all_buttons()
			tutorial_manager.enable_helper()
			var label = step_helper_time.get_node("RichTextLabel")
			start_text_label_animation(label)

func close_helper_time_step():
	hidden_all_steps()
	step_out.visible = true

func close_out_step(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() && event.get_button_index() == BUTTON_LEFT:
			hidden_all_steps()
			tutorial_manager.skip_tutorial()
