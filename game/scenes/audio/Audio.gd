extends Node2D

func play_found_item():
	get_node("AcharItem").play()

func play_found_all_items():
	get_node("FindAll").play()

func play_button_confirm():
	get_node("Confirmar").play()

func play_button_back():
	get_node("Voltar").play()
