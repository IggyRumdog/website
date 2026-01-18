extends RigidBody2D
class_name INTERACTABLESIGNS
@onready var interactSign: Node2D = $'InteractSign'
@onready var PointOfInterest: Sprite2D = $'Exclamation'

@export var DisplayText: String
@onready var speech_box: CanvasLayer = $SpeechBox

func _ready() -> void:
	get_node("SpeechBox/BoxContainer/TNDialogueBox/TextEdit").text = DisplayText
	speech_box.hide()
	interactSign.visible = false
	
#PLAYER ENTERS COLLISISON - DISPLAY INTERACT TEXT
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PLAYER:
		interactSign.visible = true
		PointOfInterest.hide()
		body.interactionReference = self

#PLAYER LEAVES COLLISSION - HIDE TEXT AND RESET PLAYER VALUES
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is PLAYER:
		interactSign.hide()
		PointOfInterest.show()
		body.clearActionValues()
		resetAction()


func activateAction() -> void:
	speech_box.show()
	
func resetAction() -> void:
	speech_box.hide()
