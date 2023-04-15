extends Control

@onready var transition = get_node("../../UI/SceneTransitionRect")

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_game_pressed():
	transition.transition_to("res://Scenes/TestScene1.tscn")


func _on_settings_pressed():
	pass # Replace with function body.


func _on_credits_pressed():
	pass # Replace with function body.


func _on_exit_game_pressed():
	pass # Replace with function body.
