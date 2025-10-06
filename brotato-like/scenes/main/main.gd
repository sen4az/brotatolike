extends Node

@export var end_screen_scene: PackedScene

func _ready():
	$%Player.health_component.died.connect(on_player_died)
	
func on_player_died():
	var end_sceen_instance = end_screen_scene.instantiate()
	add_child(end_sceen_instance)
	end_sceen_instance.set_defeat()
