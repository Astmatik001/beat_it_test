@abstract class_name sound_tile
extends movement_tile


func play_my_sound() -> void:
	$sound_object.reset()
	#TODO: get children recursively, modify sound
	$sound_object.play_my_sound()
