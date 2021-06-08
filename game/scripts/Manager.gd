extends Node2D

var should_run_map_animation = true

var items = {
	Cave = [
		{ status = false, label = "Agulha" },
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
		{ status = false, label = "Carretel" },
		{ status = false, label = "Esporas" },
		{ status = false, label = "Frasco de Pimenta" },
		{ status = false, label = "Maça do Amor" },
		{ status = false, label = "Máquina Registradora" },
		{ status = false, label = "Peão" },
		{ status = false, label = "Pipoca" },
		{ status = false, label = "Pirulito" },
	],
	Station = [
		{ status = false, label = "Balança" },
		{ status = false, label = "Bolas de Gude" },
		{ status = false, label = "Cigarro" },
		{ status = false, label = "Colher" },
		{ status = false, label = "Dedal" },
		{ status = false, label = "Lingua De Sogra" },
		{ status = false, label = "Panela" },
		{ status = false, label = "Pirolito Puxa Puxa" },
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
			break

func get_items(level: String):
	return items[level]

func check_level(level: String):
	var all_items_is_founded = true
	for item in items[level]:
		if item.status == false:
			all_items_is_founded = false
			break
	if all_items_is_founded:
		level_is_completed[level] = true

func get_level_status(level: String):
	return level_is_completed[level]
