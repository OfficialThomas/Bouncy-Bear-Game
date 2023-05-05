extends CharacterBody2D

# Animation and audio
@onready var sprite = $AnimatedSprite2D
@onready var jump = $Jump
@onready var sfx = $Sfx
var jumpsfx = preload("res://Assets/Audio/Sfx/jump_sfx.wav")
var hurtsfx = preload("res://Assets/Audio/Sfx/hurt_sfx.wav")
var checksfx = preload("res://Assets/Audio/Sfx/checkpoint_sfx.wav")

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
	jump.stream = jumpsfx
	if checkpoint == null:
		respawn = position
	else:
		respawn = checkpoint.position

func _physics_process(delta):
	# Gravity and Auto Jump
	if bounce == 1:
		jump.play()
		velocity.y = JUMP_VELOCITY * b_multi
		bounce = 0
	elif not is_on_floor():
		velocity.y += gravity * delta
	else:
		jump.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	animatior(velocity.y)
	move_and_slide()

func animatior(fallingSpeed):
	#	Directional animation state
	var animation = "forward"
	if Input.is_action_pressed("left"):
		animation = "left"
	elif Input.is_action_pressed("right"):
		animation = "right"
	if abs(fallingSpeed) < 100:
		animation += "squish"
	elif abs(fallingSpeed) < 300:
		animation += "middle"
	sprite.play(animation)

func checkpoint_activated():
	sfx.stream = checksfx
	sfx.play()
	checkpoint_text.checkpoint_activated()

func player_respawn():
	sfx.stream = hurtsfx
	sfx.play()
