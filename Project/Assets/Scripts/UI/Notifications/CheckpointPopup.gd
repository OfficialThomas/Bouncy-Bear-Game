extends Control

@export var delay : float

# Reference to the _AnimationPlayer_ node
@onready var _anim_player := $VBoxContainer/RichTextLabel/AnimationPlayer
#@onready var _text := $VBoxContainer/RichTextLabel

# Called when the node enters the scene tree for the first time.
#func _ready():
#	works without this next line, not sure what to do
#	_text.modulate.a = 0.0 
#	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	testing code
#	if Input.is_action_just_pressed("left"):
#		_check_point_activated()
#	pass


func checkpoint_activated():
#	print("playing")
	_anim_player.play("FadeIn")
	await _anim_player.animation_finished
	await get_tree().create_timer(delay).timeout
	_anim_player.play_backwards("FadeIn")
	await _anim_player.animation_finished
