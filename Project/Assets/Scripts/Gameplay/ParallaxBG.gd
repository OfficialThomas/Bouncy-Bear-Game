extends Node

@onready var layer1 = $ParallaxLayer

@export var xv: float = 0
@export var yv: float = 0

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	layer1.motion_offset.x += xv * delta 
	layer1.motion_offset.y += yv * delta
