@abstract class_name sound_tile
extends movement_tile


func play_my_sound() -> void:
	$sound_object.reset()
	var _stack = get_tile_stack()
	for _tile in _stack:
		if _tile is modificator_tile:
			_tile.modify_sound($sound_object)
	$sound_object.play_my_sound()
