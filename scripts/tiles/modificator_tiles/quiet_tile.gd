class_name quiet_tile
extends modificator_tile

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if follow_mouse: position = get_global_mouse_position()

func get_tile_subtype() -> String:
	return("quiet")
