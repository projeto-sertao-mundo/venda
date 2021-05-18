extends Node2D

var items = {
	Cave = [
		{ status = false, name = "AGULHA",		label = "Agulha", sprite = "" },
		{ status = false, name = "ALFORGE",		label = "Alforge", sprite = "" },
		{ status = false, name = "BERRANTE",	label = "Berrante", sprite = "" },
		{ status = false, name = "CACHIMBO",	label = "Cachimbo", sprite = "" },
		{ status = false, name = "CHALEIRA",	label = "Chaleira", sprite = "" },
		{ status = false, name = "ESTILINGUE",	label = "Estilingue", sprite = "" },
		{ status = false, name = "IOIO",		label = "IoIo", sprite = "" },
		{ status = false, name = "PELEGO",		label = "Pelego", sprite = "" },
	],
	Church = [],
	Elephant = [],
	Station = [],
}

func item_found(level: String, name: String):
	for item in items[level]:
		if item.label == name:
			item.status = true

func get_items(level: String):
	return items[level]
