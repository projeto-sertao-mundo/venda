extends Node

export (String, "Base", "Cave", "Church", "Elephant", "Station") var music = ""
onready var music_manager = get_node("/root/Music")

func _ready():
	if music == "Base": music_manager.enable_base()
	elif music == "Cave": music_manager.enable_cave()
	elif music == "Church": music_manager.enable_church()
	elif music == "Elephant": music_manager.enable_elephant()
	elif music == "Station": music_manager.enable_station()
