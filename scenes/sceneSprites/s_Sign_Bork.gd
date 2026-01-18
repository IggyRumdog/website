extends RigidBody2D
class_name INTERACTABLE
@onready var exclamation: Sprite2D = $Exclamation
@onready var interact_sign: Node2D = $IneractSign
@onready var bork_sign_zoomed: CanvasLayer = $BorkSignZoomed


func _ready() -> void:
	exclamation.show()
	interact_sign.hide()
	bork_sign_zoomed.hide()
	

#PLAYER ENTERS COLLISISON - DISPLAY INTERACT TEXT
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PLAYER:
		interact_sign.show()
		exclamation.hide()
		body.interactionReference = self

#PLAYER LEAVES COLLISSION - HIDE TEXT AND RESET PLAYER VALUES
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is PLAYER:
		interact_sign.hide()
		exclamation.show()
		body.clearActionValues()
		resetAction()


func activateAction() -> void:
	bork_sign_zoomed.show()
	
	
func resetAction() -> void:
	bork_sign_zoomed.hide()
