extends Node2D

onready var tutorial_manager = get_node("/root/TutorialManager")

var first_item_found = true

var items = {
	Cave = [
		{ status = false, label = "Agulha de tricô" },
		{ status = false, label = "Alforge" },
		{ status = false, label = "Berrante" },
		{ status = false, label = "Cachimbo" },
		{ status = false, label = "Chaleira" },
		{ status = false, label = "Estilingue" },
		{ status = false, label = "IoIô" },
		{ status = false, label = "Pelego" },
	],
	Church = [
		{ status = false, label = "Bacia de Flores" },
		{ status = false, label = "Bastidor" },
		{ status = false, label = "Caderno" },
		{ status = false, label = "Copo de Vidro" },
		{ status = false, label = "Espanador" },
		{ status = false, label = "Presépio" },
		{ status = false, label = "Isqueiro" },
		{ status = false, label = "Tecido de Chita" },
	],
	Elephant = [
		{ status = false, label = "Carretel de linha" },
		{ status = false, label = "Esporas" },
		{ status = false, label = "Frasco de Pimenta" },
		{ status = false, label = "Maçã do Amor" },
		{ status = false, label = "Máq Registradora" },
		{ status = false, label = "Peão" },
		{ status = false, label = "Pipoca" },
		{ status = false, label = "Pirulito" },
	],
	Station = [
		{ status = false, label = "Balança" },
		{ status = false, label = "Bolinhas de gude" },
		{ status = false, label = "Cigarro de palha" },
		{ status = false, label = "Colher de pau" },
		{ status = false, label = "Dedal" },
		{ status = false, label = "Língua De Sogra" },
		{ status = false, label = "Panela" },
		{ status = false, label = "Pirulito Puxa Puxa" },
	],
}

var level_is_completed = {
	Cave = false,
	Church = false,
	Elephant = false,
	Station = false,
}

func item_found(level: String, name: String):
	for item in items[level]:
		if item.label == name:
			item.status = true
			check_level(level)
			if first_item_found && tutorial_manager.tutorial_is_running:
				first_item_found = false
				tutorial_manager.show_item_first_step()
			break

func get_items(level: String):
	return items[level]

func check_item(level: String, item_name: String):
	var item_status = false;
	for item in items[level]:
		if item.label == item_name:
			item_status = item.status
			break
	return item_status

func check_level(level: String):
	var all_items_is_founded = true
	for item in items[level]:
		if item.status == false:
			all_items_is_founded = false
			break
	if all_items_is_founded:
		level_is_completed[level] = true

func check_game():
	var status = true
	for level_status in level_is_completed:
		if level_is_completed[level_status] == false:
			status = false
			break
	return status

func get_level_status(level: String):
	return level_is_completed[level]
