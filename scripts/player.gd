extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0
var isAlive : bool = true
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# GET_AXIS is defining the positive and negative
	# either -1 or 1
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction == 1 && isAlive:
		animated_sprite_2d.flip_h = false
	elif direction == -1 && isAlive:
		animated_sprite_2d.flip_h = true
		
	if not is_on_floor() && isAlive:
		animated_sprite_2d.play("jump")
	elif direction == 0 && isAlive:
		animated_sprite_2d.play("idle")
	elif isAlive:
		animated_sprite_2d.play("run")
	else: 
		animated_sprite_2d.play("hurt")
		
	if direction && isAlive:
		velocity.x = direction * SPEED
	elif isAlive:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
