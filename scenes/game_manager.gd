extends Node
@onready var ui_coins: CanvasLayer = $UI_Coins
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var score: int = 0

func add_point():
	score += 1
	audio_stream_player_2d.play()
	ui_coins.get_node("Label").text = str(score)
