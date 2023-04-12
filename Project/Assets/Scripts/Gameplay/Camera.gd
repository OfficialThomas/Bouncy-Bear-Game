extends Node

@onready var player = get_node("../Player")

var height = ProjectSettings.get_setting("display/window/size/viewport_height")
var width = ProjectSettings.get_setting("display/window/size/viewport_width")

var differenceY
var differenceX


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	differenceY = self.position.x - player.position.y
	differenceX = self.position.x - player.position.x
	
	# Lerp camera towards player when it moves towards a viewport border
