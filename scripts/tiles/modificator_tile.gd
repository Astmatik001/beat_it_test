@abstract class_name modificator_tile
extends movement_tile



#func play_my_sound() -> void:
	#$sound_object.play_my_sound()

func get_tile_type() -> int:
	return GlobalVariables.Modificator

@abstract func modify_sound(soubd_object) -> void
