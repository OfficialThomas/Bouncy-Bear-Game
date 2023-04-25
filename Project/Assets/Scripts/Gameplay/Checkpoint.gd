extends Area2D

@onready var player = get_node("../../Player")
@onready var anim = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player.checkpoint != self:
		anim.play("unmarked")
	else:
		anim.play("marked")


func _on_body_entered(body):
	if body.name == "Player":
		if player.checkpoint != self:
			player.checkpoint_activated()
			player.checkpoint = self
			player.respawn = position
