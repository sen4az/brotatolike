extends Node2D

@export var health_component: Node
@export var sprite: Sprite2D

func _ready() -> void:
    $GPUParticles2D.texture = sprite.texture
    health_component.died.connect(_on_died)

func _on_died() -> void:
    # save the current position for respawn
    var spawn_pos: Vector2 = global_position
    # find and reparent to the 'enemy' container
    var container = get_tree().get_first_node_in_group("enemy") as Node2D
    if container != null:
        get_parent().remove_child(self)
        container.add_child(self)
        global_position = spawn_pos
    # defer playing the animation to the next idle frame
    call_deferred("_play_default")

func _play_default() -> void:
    $AnimationPlayer.stop()
    $AnimationPlayer.play("default", 0.0)