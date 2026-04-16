class_name quiet_tile
extends modificator_tile


func get_tile_type() -> int:
	return GlobalVariables.Quiet

func modify_sound(o) -> void:
	o.change_volume(-10)
