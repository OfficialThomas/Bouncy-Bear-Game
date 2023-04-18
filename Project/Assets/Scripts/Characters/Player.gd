extends CharacterBody2D

# Animation and audio
@onready var sprite = $AnimatedSprite2D

# Jumping and moving
const  SPEED = 400.0
const JUMP_VELOCITY = -1075

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Gameplay elements
var bounce = 0
var b_multi = 1.5
@export var checkpoint : Area2D
var respawn
@onready var checkpoint_text = get_node("../../UI/CheckpointNotif")

# Called when the node enters the scene tree for the first time.
func _ready():
	if checkpoint == null:
		respawn = position
	else:
		respawn = checkpoint.position

func _physics_process(delta):
	# Gravity and Auto Jump
	if bounce == 1:
		velocity.y = JUMP_VELOCITY * b_multi
		bounce = 0
	elif not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

#	Directional animation state
	if Input.is_action_pressed("left"):
		sprite.play("left")
	elif Input.is_action_pressed("right"):
		sprite.play("right")
	else:
		sprite.play("foward")

	move_and_slide()

func checkpoint_activated():
	checkpoint_text.checkpoint_activated()
