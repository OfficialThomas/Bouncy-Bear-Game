extends Control

# Transition animation object
@onready var transition = get_node("../../UI/SceneTransitionRect")

# Universal scene change (5 button layout)
@export_file("*.tscn") var return_scene : String
@export_file("*.tscn") var next_scene : String
@export_file("*.tscn") var tutorial_scene: String
@export_file("*.tscn") var level_1_scene : String
@export_file("*.tscn") var level_2_scene : String
@export_file("*.tscn") var level_3_scene : String


# Called when the node enters the scene tree for the first time.
func _ready():
#	print("1: " + return_scene)
#	print("2: " + next_scene)
#	print("3: " + level_1_scene)
#	print("4: " + level_2_scene)
#	print("5: " + level_3_scene)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass


# Return to the previous scene (default is main menu)
func _on_return_pressed():
#	print("Transitioning to: " + return_scene)
	if (return_scene == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(return_scene)

#next scene (default is credits)
func _on_next_pressed():
#	print("Transitioning to: " + next_scene)
	if (next_scene == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(next_scene)

#enter level 1 scene (default is the playtest scene - playground)
func _on_level_1_pressed():
#	print("Transitioning to: " + level_1_scene)
	if (level_1_scene == ""):
#		print("Scene name empty. Transitioning to test level.")
		transition.transition_to("res://Scenes/TestScene1.tscn")
	else:
		transition.transition_to(level_1_scene)

#enter level 2 scene (default is the playtest scene - playground)
func _on_level_2_pressed():
#	print("Transitioning to: " + level_2_scene)
	if (level_2_scene == ""):
#		print("Scene name empty. Transitioning to test level.")
		transition.transition_to("res://Scenes/TestScene1.tscn")
	else:
		transition.transition_to(level_2_scene)

#enter level 3 scene (default is the playtest scene - playground)
func _on_level_3_pressed():
#	print("Transitioning to: " + level_3_scene)
	if (level_3_scene == ""):
#		print("Scene name empty. Transitioning to test level.")
		transition.transition_to("res://Scenes/TestScene1.tscn")
	else:
		transition.transition_to(level_3_scene)


func _on_tutorial_pressed():
#	print("Transitioning to: " + level_1_scene)
	if (tutorial_scene == ""):
#		print("Scene name empty. Transitioning to test level.")
		transition.transition_to("res://Scenes/TestScene1.tscn")
	else:
		transition.transition_to(tutorial_scene)
