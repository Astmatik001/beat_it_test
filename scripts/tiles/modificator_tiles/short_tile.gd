class_name short_tile
extends modificator_tile


func get_tile_subtype() -> String:
	return("short")

func modify_sound(o) -> void:
	o.change_scale(4)
