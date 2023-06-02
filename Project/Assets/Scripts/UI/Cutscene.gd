extends Control

#Animation
@onready var ani_player = $AnimationPlayer
# Transition animation object
@onready var transition = get_node("../../UI/SceneTransitionRect")

#Scene Loaders
@export_file("*.tscn") var main_menu : String
@export_file("*.tscn") var level_select : String

#State Variable(s)
var state = 1 	#default - cards are all currently on the pile
var prevState = 1 	#default - no previous state

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func update_state():
	match (state):
		0:
			print("Transitioning to: " + str(main_menu))
			if (main_menu == ""):
				print("Scene name empty. Transitioning to main menu.")
				transition.transition_to("res://Scenes/StartupMenu.tscn")
			else:
				transition.transition_to(main_menu)
		1, 2, 3:
			var animate = str(prevState) + "to" + str(state)
			print("Animation: " + animate)
			match (animate):
				"1to2":
					ani_player.play(animate)
				"2to3":
					ani_player.play(animate)
				"3to2":
					ani_player.play_backwards('2to3')
				"2to1":
					ani_player.play_backwards('1to2')
		4:
			print("Transitioning to: " + str(level_select))
			if (level_select == ""):
				print("Scene name empty. Transitioning to main menu.")
				transition.transition_to("res://Scenes/StartupMenu.tscn")
			else:
				transition.transition_to(level_select)
	prevState = state


func _on_back_pressed():
	state -= 1
	update_state()


func _on_next_pressed():
	state += 1
	update_state()
