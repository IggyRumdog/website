extends CanvasLayer

@onready var text_edit: TextEdit = $BoxContainer/TNDialogueBox/TextEdit

# Called when the node enters the scene tree for the first time.
func BeginPlaySetText(text: String) -> void:
	text_edit.text = text
