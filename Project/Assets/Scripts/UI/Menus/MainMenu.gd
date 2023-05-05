extends Control

@onready var transition = get_node("../../UI/SceneTransitionRect")

#universal scene change
@export_file("*.tscn") var next_scene : String
@export_file("*.tscn") var settings_scene : String
@export_file("*.tscn") var guide_scene : String
@export_file("*.tscn") var credits_scene : String


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_game_pressed():
#	print("Transitioning to: " + next_scene)
	if (next_scene == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(next_scene)


func _on_settings_pressed():
#	print("Transitioning to: " + settings_scene)
	if (settings_scene == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(settings_scene)


func _on_credits_pressed():
#	print("Transitioning to: " + credits_scene)
	if (credits_scene == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(credits_scene)


func _on_exit_game_pressed():
	transition.close_game()


func _on_control_guide_pressed():
#	print("Transitioning to: " + credits_scene)
	if (guide_scene == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(guide_scene)
