extends CharacterBody2D
class_name PLAYER
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var controller_sprite: AnimatedSprite2D = $CanvasLayer/ControllerSprite




var upPressed: bool = false
var downPressed: bool = false
var leftPressed: bool = false
var rightPressed: bool = false

const SPEED = 35
const JUMP_VELOCITY = -400.0

func _physics_process(_delta: float) -> void:
	#=======SETTING VARIABLES==============================================
	var directionX := Input.get_axis("Move_Left", "Move_Right")
	var directionY := Input.get_axis("Move_Up", "Move_Down")
	moveSprite(directionX, directionY)
	




func _ready():
	NavigationManager.on_trigger_player_spawn.connect(_on_spawn)
	
func _on_spawn(position: Vector2, direction:String):
	global_position = position

func moveSprite(x: float, y: float):
		
	#=======SETTING VARIABLES==============================================
	if x > 0:
		animated_sprite_2d.flip_h = false
	elif x < 0:
		animated_sprite_2d.flip_h = true
	#=======MOVING==============================================
	if x !=0 || y !=0:
		velocity.x = x * SPEED
		velocity.y = y * SPEED
		animated_sprite_2d.play("Move")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		animated_sprite_2d.play("Idle")

	move_and_slide()
