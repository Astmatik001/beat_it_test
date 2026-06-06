class_name loud_tile
extends modificator_tile


func get_tile_type() -> int:
	return Global.tiles.LOUD

func modify_sound(o) -> void:
	o.change_volume(10)

func modify_score(score) -> void:
	score.beat += 1
