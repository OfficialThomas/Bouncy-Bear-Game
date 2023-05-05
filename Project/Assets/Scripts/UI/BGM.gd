extends Control

@export var songNum : int = 0

@onready var audio = $AudioStreamPlayer
@onready var menu = preload("res://Assets/Audio/Music/menu_music.wav")
@onready var area1 = preload("res://Assets/Audio/Music/area_1_music.wav")
#@onready var
@onready var victory = preload("res://Assets/Audio/Music/level_end_music.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	match songNum:
		0:
			audio.stream = menu
			pass
		1:
			audio.stream = area1
			pass
		2:
			pass
	audio.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func end_level():
	audio.stop()
	audio.stream = victory
	audio.play()
