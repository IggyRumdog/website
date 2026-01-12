extends Node

const scene_main = preload("res://scenes/main/MainGame.tscn")
const scene_office = preload("res://scenes/main/office.tscn")

signal on_trigger_player_spawn

var spawn_door_tag

func go_to_level(level_tag, destination_tag):
	var sceneToLoad
	
	match level_tag:
		"MainGame":
			sceneToLoad = scene_main
		"office":
			sceneToLoad = scene_office
			
	if sceneToLoad != null:
		spawn_door_tag = destination_tag
		get_tree().change_scene_to_packed(sceneToLoad)
		
		
func trigger_player_spawn(position: Vector2, direction: String):
	on_trigger_player_spawn.emit(position, direction)
