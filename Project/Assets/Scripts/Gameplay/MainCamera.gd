extends Camera2D

#Works cited
#https://youtu.be/QH5YtfVq6g0

@export var tilemap: TileMap

@export var songNum : int = 0

@onready var audio = $AudioStreamPlayer
@onready var menu = preload("res://Assets/Audio/Music/menu_music.wav")
@onready var area1 = preload("res://Assets/Audio/Music/area_1_music.wav")
# add more songs here
#@onready var victory =

@onready var player = get_node("../../Gameplay/Player")

var level_end = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var worldSizeInPixels = mapRect.size * tileSize
	limit_right = worldSizeInPixels.x
	limit_bottom = worldSizeInPixels.y
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
