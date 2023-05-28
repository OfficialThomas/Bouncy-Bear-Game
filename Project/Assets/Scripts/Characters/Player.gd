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
@export var f_fallspeed = 100
var activeFfall = false
var coins = 0
var timer = 0
var respawn
var checkpoint : Area2D
@onready var checkpoint_text = get_node("../../UI/LevelUIManager")

# Called when the node enters the scene tree for the first time.
func _ready():
	jump.stream = jumpsfx
	if checkpoint == null:
		respawn = position
	else:
		respawn = checkpoint.position

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Fast fall
	if not is_on_floor() and Input.is_action_just_pressed("down"):
		if !activeFfall:
			velocity.y = f_fallspeed
			activeFfall = true
	
	#	Directional animation state
	var animation = "forward"
	if Input.is_action_pressed("left"):
		animation = "left"
	elif Input.is_action_pressed("right"):
		animation = "right"
	
	# Constant gravity doesnt affect our gameplay and removes it from conditionals
	velocity.y += gravity * delta
	
	# Vertical animation state and jump collision
	if bounce == 1:
		velocity.y = JUMP_VELOCITY * b_multi
		bounce = 0
		jump.play()
		animation += "squish"
		timer = 10
		activeFfall = false
	elif is_on_floor() or is_on_ceiling() or bounce == 2:
		if is_on_floor() or bounce == 2:
			velocity.y = JUMP_VELOCITY
			activeFfall = false
		bounce = 0
		jump.play()
		animation += "squish"
		timer = 10
	elif timer > 5:
		animation += "squish"
		timer -= 1
	elif timer > 0:
		animation += "middle"
		timer -= 1
	
	sprite.play(animation)
	move_and_slide()

func checkpoint_activated():
	sfx.stream = checksfx
	sfx.play()
	checkpoint_text.checkpoint_activated()

func collect_coin():
	sfx.stream = checksfx
	sfx.play()
	coins += 1

func player_respawn():
	sfx.stream = hurtsfx
	sfx.play()
