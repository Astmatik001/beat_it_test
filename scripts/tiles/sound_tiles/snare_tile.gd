class_name snare_tile
extends sound_tile

var pf1_stream = preload("res://streams/pf1_stream.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$sound_object.set_sound(pf1_stream)

func get_tile_type() -> int:
	return GlobalVariables.Snare
