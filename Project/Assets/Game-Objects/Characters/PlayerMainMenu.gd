extends CharacterBody2D

# Animation
@onready var sprite = $AnimatedSprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -700.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Gameplay elements
var bounce = 0
var b_multi = 1.5
var timer = 0
@export var f_fallspeed = 100
var activeFfall = false

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
		animation += "squish"
		timer = 10
		activeFfall = false
	elif is_on_floor() or is_on_ceiling() or bounce == 2:
		if is_on_floor() or bounce == 2:
			velocity.y = JUMP_VELOCITY
			activeFfall = false
		bounce = 0
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
