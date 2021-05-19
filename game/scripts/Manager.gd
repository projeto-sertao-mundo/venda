extends Node2D

var items = {
	Cave = [
		{ status = false, label = "Agulha" },
		{ status = false, label = "Alforge" },
		{ status = false, label = "Berrante" },
		{ status = false, label = "Cachimbo" },
		{ status = false, label = "Chaleira" },
		{ status = false, label = "Estilingue" },
		{ status = false, label = "IoIo" },
		{ status = false, label = "Pelego" },
	],
	Church = [
		{ status = false, label = "Bacia de Flores" },
		{ status = false, label = "Bastidor" },
		{ status = false, label = "Caderno" },
		{ status = false, label = "Copo de Vidro" },
		{ status = false, label = "Espanador" },
		{ status = false, label = "Presepio" },
		{ status = false, label = "Tabletes" },
		{ status = false, label = "Tecido de Chita" },
	],
	Elephant = [],
	Station = [],
}

func item_found(level: String, name: String):
	for item in items[level]:
		if item.label == name:
			item.status = true
	print(items)

func get_items(level: String):
	return items[level]
