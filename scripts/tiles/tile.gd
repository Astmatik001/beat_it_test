@abstract class_name tile
extends Area2D

@abstract func get_tile_type() -> int

func is_getting_followed() -> bool:
	for child in get_children():
		if child is movement_tile:
			return true
	return false
