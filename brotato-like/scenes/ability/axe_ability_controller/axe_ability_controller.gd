extends Node

@export var axe_ability_scene: PackedScene

var damage = 10

func _ready():
	$Timer.timeout.connect(on_timer_timeout)
	
func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	var axe_instance = axe_ability_scene.instantiate() as Node2D
	player.get_parent().add_child(axe_instance)
	axe_instance.global_position = player.global_position
	axe_instance.hit_box_component.damage = damage
