extends CanvasLayer

@export var  arena_time_manager: Node
@onready var label = $%Label

func _process(delta):
	if arena_time_manager == null:
		return
	var time_elapsed = arena_time_manager.get_time_elapsed()
	label.text = format_seconds_to_string(time_elapsed)


func format_seconds_to_string(seconds: float) -> String:
	var total_seconds: int = int(seconds)
	var minutes: int = total_seconds / 60
	var secs: int = total_seconds % 60
	return "%d:%02d" % [minutes, secs]
