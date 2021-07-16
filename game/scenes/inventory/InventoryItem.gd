extends TextureRect

export (String) var item_name = "";
export (String) var item_description = "";

var modal_animation;
var modal_title;
var modal_description;

func _ready():
	var inventory = find_parent("Inventory")
	modal_animation = inventory.get_node("InformationModal/Modal/AnimationPlayer")
	modal_title = inventory.get_node("InformationModal/Modal/ItemName")
	modal_description = inventory.get_node("InformationModal/Modal/ItemDescription")

func update_modal_detail():
	modal_title.text = item_name
	modal_description.text = item_description
	modal_animation.play("Show")

func _on_click_item(event: InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed():
			update_modal_detail()
