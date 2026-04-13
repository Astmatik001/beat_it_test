class_name modificator_tile
extends movement_tile



func play_my_sound() -> void:
	$sound_object.play_my_sound()

func get_tile_type() -> String:
	return "modificator_tile"
