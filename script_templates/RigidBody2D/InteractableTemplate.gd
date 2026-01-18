extends RigidBody2D
class_name INTERACTABLE
@onready var interactText: Label = $'InteractText'
@onready var displayText: Label = $'DisplayText'
@onready var PointOfInterest: Sprite2D = $'PointOfInterest'

func _ready() -> void:
	displayText.hide()
	interactText.hide()
	print("test")

#PLAYER ENTERS COLLISISON - DISPLAY INTERACT TEXT
func _on_area_2d_body_enetered(body: Node2D) -> void:
	if body is PLAYER:
		interactText.show()
		PointOfInterest.hide()
		body.interactionReference = self

#PLAYER LEAVES COLLISSION - HIDE TEXT AND RESET PLAYER VALUES
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is PLAYER:
		interactText.hide()
		displayText.hide()
		PointOfInterest.show()
		body.clearActionValues()


func activateAction() -> void:
	displayText.show()
	
	
func resetAction() -> void:
	displayText.hide()
