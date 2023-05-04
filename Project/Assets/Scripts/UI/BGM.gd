extends Control

@onready var audio = $AudioStreamPlayer
@onready var menu = preload("res://Assets/Audio/Music/menu_music.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	audio.stream = menu
	audio.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
