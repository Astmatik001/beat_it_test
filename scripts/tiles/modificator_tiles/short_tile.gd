class_name short_tile
extends modificator_tile


func get_tile_type() -> int:
	return GlobalVariables.Short

func modify_sound(o) -> void:
	o.change_scale(4)
