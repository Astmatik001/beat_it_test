class_name hi_hat_tile
extends sound_tile

var t1_stream = preload("res://streams/t1_stream.tres")

func _ready() -> void:
	$sound_object.set_sound(t1_stream)

func _process(_delta: float) -> void:
	if follow_mouse: position = get_global_mouse_position()


func get_tile_type() -> int:
	return GlobalVariables.HiHat
