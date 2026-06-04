@abstract class_name movement_tile
extends tile

var default_position: Vector2
var occupied = false

func get_default_position() -> Vector2:
	return default_position

func set_default_position(new_position: Vector2):
	default_position = new_position

func reset_position() -> void:
	position = default_position

func is_getting_followed() -> bool:
	return occupied

@warning_ignore("unused_signal")
signal release_me()
