class_name long_tile
extends modificator_tile


func get_tile_type() -> int:
	return GlobalVariables.Long
	
func modify_sound(o) -> void:
	o.change_scale(0.25)

func modify_score(score) -> void:
	score.engine += 1
