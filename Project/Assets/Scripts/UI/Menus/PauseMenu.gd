extends Control

#	Works Cited:
#	https://docs.godotengine.org/en/stable/tutorials/scripting/pausing_games.html#pause-menu-example


# Transition animation object
@onready var transition = get_node("../../UI/SceneTransitionRect")

# Grabs the base nodes of the scene
@onready var gameplay = get_node("../../Gameplay")
@onready var ui = get_node("../../UI")

# Universal scene change (5 button layout)
@export_file("*.tscn") var level_select : String
@export_file("*.tscn") var main_menu : String
#@export_file("*.tscn") var level_1_scene : String
#@export_file("*.tscn") var level_2_scene : String
#@export_file("*.tscn") var level_3_scene : String


# Called when the node enters the scene tree for the first time.
func _ready():
	gameplay.process_mode = Node.PROCESS_MODE_PAUSABLE
	ui.process_mode = Node.PROCESS_MODE_ALWAYS
	position.y = -2000


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()


func pauseMenu():
	if position.y == -2000:
		get_tree().paused = true
		position.y = 0
	else:
		position.y = -2000
		get_tree().paused = false


func _on_continue_pressed():
	pauseMenu()


func _on_level_select_pressed():
#	print("Transitioning to: " + next_scene)
	if (level_select == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(level_select)


func _on_main_menu_pressed():
#	print("Transitioning to: " + next_scene)
	if (main_menu == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(main_menu)


func _on_exit_game_pressed():
	transition.close_game()