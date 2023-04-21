extends Control

#	Works Cited:
#	https://stackoverflow.com/questions/72242732/how-do-i-create-a-timer-in-godot

@onready var transition = get_node("../../UI/SceneTransitionRect")

@export_file("*.tscn") var next_scene : String


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass


func _on_main_menu_pressed():
#	print("Transitioning to: " + next_scene)
	if (next_scene == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(next_scene)
