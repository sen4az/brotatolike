extends Node2D

@export var health_component: Node
@export var sprite: Sprite2D

func _ready() -> void:
    $GPUParticles2D.texture = sprite.texture
    health_component.died.connect(_on_died)

func _on_died() -> void:
    # save current position for respawn
    var spawn_pos: Vector2 = global_position

    # reparent into the 'enemy' container
    var container := get_tree().get_first_node_in_group("enemy") as Node2D
    if container != null:
        get_parent().remove_child(self)
        container.add_child(self)
        global_position = spawn_pos
        # play animation once added back to the scene tree
        self.connect("tree_entered", Callable(self, "_play_after_tree_entered"), [], CONNECT_ONESHOT)

func _play_after_tree_entered() -> void:
    # restart the 'default' animation
    $AnimationPlayer.stop()
    $AnimationPlayer.play("default")