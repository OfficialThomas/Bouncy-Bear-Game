extends ColorRect

#	Works Cited:
#	https://www.gdquest.com/tutorial/godot/2d/scene-transition-rect/
#	https://godotengine.org/qa/3188/current-scene-name
#	https://docs.godotengine.org/en/stable/classes/class_node.html#class-node-method-print-tree-pretty
#	https://godotengine.org/qa/554/is-there-a-way-to-close-a-game-using-gdscript


# Path to the next scene to transition to
@export_file("*.tscn") var next_scene_path : String


# Reference to the _AnimationPlayer_ node
@onready var _anim_player := $AnimationPlayer


# Just in case I use this
# Grabs the base node of the scene (2d node or control node)
@onready var root = get_node("../../")


# Called when the node enters the scene tree for the first time.
func _ready():
	# Plays the animation backward to fade in
#	print(root.name) # Here for if I want to make the animation not play on a scene
	get_tree().paused = false
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

func close_game() -> void:
	# Plays the Fade animation and wait until it finishes
	_anim_player.play_backwards("SlideRight")
	await _anim_player.animation_finished
	# Close the game window
	get_tree().quit()
