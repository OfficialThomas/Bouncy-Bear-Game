extends Control

@export_multiline var text_name

# Reference to the _AnimationPlayer_ node
@onready var _anim_player := $VBoxContainer/RichTextLabel/AnimationPlayer
@onready var _text := $VBoxContainer/RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	_text.modulate.a = 1.0
	_text.append_text(text_name)
	_fade_text(1.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		_text.visible = false


func _fade_text(delay: float):
	await get_tree().create_timer(delay).timeout
	_anim_player.play("Fade")
