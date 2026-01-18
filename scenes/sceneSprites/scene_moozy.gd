extends RigidBody2D
var mooing: bool = false
var mooCounter: float = 0
@onready var label: Label = $Control/Label
var PlayerReference: CharacterBody2D = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mooing:
		label.visible_ratio = 1
	if mooing && mooCounter < 1:
		label.visible_ratio = mooCounter
		mooCounter += .3 * delta
		if mooCounter >= 1:
			await get_tree().create_timer(2).timeout
			resetAction()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PLAYER:
		body.interactionReference = self
		PlayerReference = body
		

func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.

func activateAction() -> void:
	if !mooing:
		mooing = true

	
func resetAction() -> void:
	mooCounter = 0
	label.visible_ratio = mooCounter
	mooing = false
	PlayerReference.clearActionValues()
	
	
	
