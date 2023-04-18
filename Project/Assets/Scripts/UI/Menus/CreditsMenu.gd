extends Control

#	Works Cited:
#	https://stackoverflow.com/questions/72242732/how-do-i-create-a-timer-in-godot

@onready var transition = get_node("../../UI/SceneTransitionRect")

@export_file("*.tscn") var next_scene : String

# My name in the credits
@onready var _thomas = $Contents/NamePlate/NinePatchRect/CreditNames/Thomas
@onready var _godot = $Contents/NamePlate/NinePatchRect/CreditNames/Godot


# Called when the node enters the scene tree for the first time.
func _ready():
	_change_code(3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass

func _change_code(delay: float):
	await get_tree().create_timer(delay).timeout
	_thomas.text = "[center]Bouncy Bear by [rainbow][wave]Thomas Noell[/wave][/rainbow][/center]"
	_godot.text = "[center][tornado]Made using Godot 4[tornado][center]"


func _on_main_menu_pressed():
#	print("Transitioning to: " + next_scene)
	if (next_scene == ""):
#		print("Scene name empty. Transitioning to main menu.")
		transition.transition_to("res://Scenes/StartupMenu.tscn")
	else:
		transition.transition_to(next_scene)
