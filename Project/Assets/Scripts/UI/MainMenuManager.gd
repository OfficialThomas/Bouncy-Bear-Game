extends Control

#Transition animator
@onready var transition = get_node("../../UI/SceneTransitionRect")

#Universal scene change
@export_file("*.tscn") var select_scene : String

#All mid-transition menus
@onready var main_menu = $MainMenu
@onready var guide_menu = $GuideMenu
@onready var credits_menu = $CreditsMenu
#@onready var settings_menu = $SettingsMenu
#-> Not currently implemented, must add later or remove settings button


# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu.visible = true
	guide_menu.visible = false
	credits_menu.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_game_pressed():
#	print("Transitioning to: " + next_scene)
	if (select_scene == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(select_scene)


func _on_settings_pressed():
	transition.leave()
	await get_tree().create_timer(0.5).timeout
	main_menu.visible = false
	guide_menu.visible = false
	credits_menu.visible = false
#	settings_menu.visible = true
	transition.enter() 


func _on_control_guide_pressed():
	transition.leave()
	await get_tree().create_timer(0.5).timeout
	main_menu.visible = false
	guide_menu.visible = true
	credits_menu.visible = false
#	settings_menu.visible = false
	transition.enter() 


func _on_credits_pressed():
	transition.leave()
	await get_tree().create_timer(0.5).timeout
	main_menu.visible = false
	guide_menu.visible = false
	credits_menu.visible = true
#	settings_menu.visible = false
	transition.enter()  


func _on_main_menu_pressed():
	transition.leave()
	await get_tree().create_timer(0.5).timeout
	main_menu.visible = true
	guide_menu.visible = false
	credits_menu.visible = false
#	settings_menu.visible = false
	transition.enter()  


func _on_exit_game_pressed():
	transition.close_game()
