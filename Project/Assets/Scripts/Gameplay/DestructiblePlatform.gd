extends Area2D

@onready var player = get_node("../../Player")
@onready var collision = $CollisionShape2D
var enabled = true
var timer = 0

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if timer > 0:
		timer -= 1
	else:
		enabled = true
		modulate.a = 1


func _on_body_entered(body):
	if body.name == "Player" and enabled:
		player.bounce = 2
		modulate.a = 0.5
		enabled = false
		timer = 1000
