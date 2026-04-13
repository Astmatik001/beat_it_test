class_name long_tile
extends modificator_tile


func get_tile_subtype() -> String:
	return("long")
	
func modify_sound(o) -> void:
	o.change_scale(0.25)
