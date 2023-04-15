extends ColorRect

#	Works Cited:
#	https://www.gdquest.com/tutorial/godot/2d/scene-transition-rect/

# Path to the next scene to transition to
@export_file("*.tscn") var next_scene_path : String

# Reference to the _AnimationPlayer_ node
@onready var _anim_player := $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	# Plays the animation backward to fade in
	_anim_player.play("SlideLeft")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func transition_to(_next_scene := next_scene_path) -> void:
	# Plays the Fade animation and wait until it finishes
	_anim_player.play_backwards("SlideRight")
	await _anim_player.animation_finished
	# Changes the scene
	get_tree().change_scene_to_file(_next_scene)
