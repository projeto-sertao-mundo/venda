extends Node2D

onready var manager = get_node("/root/Manager")

onready var audio_base = get_node("Base")
onready var audio_cave = get_node("Cave")
onready var audio_church = get_node("Church")
onready var audio_elephant = get_node("Elephant")
onready var audio_station = get_node("Station")

var volume_disable = -80
var volume_enable = -2

func _ready():
	disable_all()
	audio_base.playing = true
	audio_cave.playing = true
	audio_church.playing = true
	audio_elephant.playing = true
	audio_station.playing = true

func disable_all():
	audio_base.volume_db = volume_disable
	disable_cave()
	disable_church()
	disable_elephant()
	disable_station()

func enable_base():
	disable_all()
	audio_base.volume_db = volume_enable

func enable_cave():
	disable_all()
	enable_base()
	audio_cave.volume_db = 8
	
func enable_church():
	disable_all()
	enable_base()
	audio_church.volume_db = volume_enable

func enable_elephant():
	disable_all()
	enable_base()
	audio_elephant.volume_db = 0

func enable_station():
	disable_all()
	enable_base()
	audio_station.volume_db = 4

func disable_cave():
	var status = manager.get_level_status("Cave")
	if status == false: audio_cave.volume_db = volume_disable

func disable_church():
	var status = manager.get_level_status("Church")
	if status == false: audio_church.volume_db = volume_disable

func disable_elephant():
	var status = manager.get_level_status("Elephant")
	if status == false: audio_elephant.volume_db = volume_disable

func disable_station():
	var status = manager.get_level_status("Station")
	if status == false: audio_station.volume_db = volume_disable
