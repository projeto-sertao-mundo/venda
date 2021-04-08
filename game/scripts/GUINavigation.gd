extends Button

func _on_PlayGame_pressed():
	get_tree().change_scene("res://scenes/store-out.tscn")

func _on_BackMenu_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")

func _on_BackStoreOut_pressed():
	get_tree().change_scene("res://scenes/store-out.tscn")

func _on_BackLevelChoice_pressed():
	get_tree().change_scene("res://scenes/levels.tscn")

func _on_EnterStore_pressed():
	get_tree().change_scene("res://scenes/store.tscn")

func _on_EnterLevelChoice_pressed():
	get_tree().change_scene("res://scenes/levels.tscn")

func _on_EnterLevel01_pressed():
	get_tree().change_scene("res://scenes/level-01.tscn")
