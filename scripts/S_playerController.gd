#INITIALIZATION
extends CharacterBody2D
class_name PLAYER

#VARIABLES
@onready var spriteAnim: AnimatedSprite2D = $SpriteAnim
var interactionReference: RigidBody2D = null
var tempRigid: RigidBody2D = null
var speed: int = 35
var moozy: Node2D = null
var tempNode: Node2D = null

#_PHYSICS_PROCESS = ON_TICK
func _physics_process(delta: float) -> void:
	
	#setting directional inout
	var x := Input.get_axis("MoveLeft", "MoveRight")
	var y := Input.get_axis("MoveUp", "MoveDown")
	moveSprite(x,y)
	
func _on_touch_screen_button_pressed() -> void:
	print(interactionReference)
	print(tempRigid)
	if interactionReference != null && tempRigid != interactionReference:
		interactionReference.activateAction()
		tempRigid = interactionReference
	elif interactionReference != null && interactionReference == tempRigid:
		interactionReference.resetAction()
		tempRigid = null

func moveSprite(x: float, y: float):
	
	#set sprite flip
	if x >= 0:
		spriteAnim.flip_h = false
	elif x < 0:
		spriteAnim.flip_h = true
	#=======MOVING==============================================
	if x !=0 || y !=0:
		velocity.x = x * speed
		velocity.y = y * speed
		spriteAnim.play("RUN")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
		spriteAnim.play("IDLE")

	move_and_slide()
	
func clearActionValues() -> void:
	interactionReference = null
	tempRigid = null
