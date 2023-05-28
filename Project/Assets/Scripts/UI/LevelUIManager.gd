extends Control

#	Works Cited:
#	https://docs.godotengine.org/en/stable/tutorials/scripting/pausing_games.html#pause-menu-example
#	https://godotengine.org/qa/32219/gdscript-get-resource-path-of-current-scene-tscn

# Edit the title name and grab title node path
@export_multiline var level_name
@onready var title_pause = $PauseMenu/System/PausedText/Level
@onready var title_end = $EndCardMenu/HBoxContainer/Contents/Level
@onready var title_intro = $LevelName/VBoxContainer/HBoxContainer/RichTextLabel
@onready var intro_player = $LevelName/VBoxContainer/HBoxContainer/RichTextLabel/AnimationPlayer
@onready var check_player = $CheckpointNotif/VBoxContainer/RichTextLabel/AnimationPlayer

# Transition animation object
@onready var transition = get_node("../../UI/SceneTransitionRect")
# Background Music
@onready var bgm = get_node("../../UI/BGM")

# Grabs the base nodes of the scene
@onready var gameplay = get_node("../../Gameplay")
@onready var ui = get_node("../../UI")
@onready var pause_card = $PauseMenu
@onready var end_card = $EndCardMenu

# Universal scene change
@export_file("*.tscn") var level_select : String
@export_file("*.tscn") var main_menu : String
@export_file("*.tscn") var restart_scene : String
@export_file("*.tscn") var next_level : String
#@export_file("*.tscn") var example_scene : String


# Called when the node enters the scene tree for the first time.
func _ready():
	restart_scene = get_tree().current_scene.scene_file_path #grabs the scene name for restarting
	title_intro.clear()
	title_pause.clear()
	title_end.clear()
	title_intro.append_text(level_name)
	title_pause.append_text(level_name)
	title_end.append_text(level_name)
	pause_card.visible = false
	end_card.visible = false
	gameplay.process_mode = Node.PROCESS_MODE_PAUSABLE
	ui.process_mode = Node.PROCESS_MODE_ALWAYS
	_fade_text(1.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()


func _fade_text(delay: float):
	await get_tree().create_timer(delay).timeout
	intro_player.play("Fade")


func checkpoint_activated():
#	print("playing")
	check_player.play("FadeIn")
	await check_player.animation_finished
	await get_tree().create_timer(1).timeout
	check_player.play_backwards("FadeIn")
	await check_player.animation_finished


func pauseMenu():
	if pause_card.visible:
		pause_card.visible = false
		get_tree().paused = false
	else:
		pause_card.visible = true
		get_tree().paused = true

func endCard():
	bgm.end_level()
	end_card.visible = true
	get_tree().paused = true 


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
