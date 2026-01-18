extends Control
@onready var text_edit: TextEdit = $TextEdit
var isWindowOpen: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text_edit.hide()


func _on_touch_screen_button_pressed() -> void:
	print(isWindowOpen)
	if isWindowOpen == false:
		text_edit.show()
		isWindowOpen = true
	elif isWindowOpen:
		text_edit.hide()
		isWindowOpen = false
