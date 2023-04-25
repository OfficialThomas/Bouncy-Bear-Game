extends Control

#	Works Cited:
#	https://docs.godotengine.org/en/stable/tutorials/scripting/pausing_games.html#pause-menu-example
#	https://godotengine.org/qa/32219/gdscript-get-resource-path-of-current-scene-tscn


# Transition animation object
@onready var transition = get_node("../../UI/SceneTransitionRect")

# Grabs the base nodes of the scene
@onready var gameplay = get_node("../../Gameplay")
@onready var ui = get_node("../../UI")
# Grabbing ui elements
@onready var levelname = get_node("../../UI/LevelName")
@onready var pause = get_node("../../UI/PauseMenu")

# Universal scene change (5 button layout)
@export_file("*.tscn") var level_select : String
@export_file("*.tscn") var restart_scene : String
@export_file("*.tscn") var next_level : String
@export_file("*.tscn") var main_menu : String
#@export_file("*.tscn") var level_3_scene : String

@onready var _levelname = $HBoxContainer/Contents/Level 

# Called when the node enters the scene tree for the first time.
func _ready():
	_levelname.clear()
	_levelname.append_text(levelname.text_name)
	restart_scene = get_tree().current_scene.scene_file_path #grabs the scene name for restarting
	gameplay.process_mode = Node.PROCESS_MODE_PAUSABLE
	ui.process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func endCard():
	pause.visible = false
	get_tree().paused = true #have to unpause when we press any buttons
	visible = true


func _on_level_select_pressed():
#	print("Transitioning to: " + next_scene)
	if (level_select == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(level_select)


func _on_restart_level_pressed():
#	print("Transitioning to: " + next_scene)
	if (restart_scene == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(restart_scene)


func _on_next_level_pressed():
#	print("Transitioning to: " + next_scene)
	if (next_level == ""):
#		print("Scene name empty. Replaying level.")
		transition.transition_to(restart_scene)
	else:
		transition.transition_to(next_level)


func _on_main_menu_pressed():
#	print("Transitioning to: " + next_scene)
	if (main_menu == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(main_menu)
