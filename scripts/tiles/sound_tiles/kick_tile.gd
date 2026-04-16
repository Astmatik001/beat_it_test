class_name kick_tile
extends sound_tile

var b1_stream = preload("res://streams/b1_stream.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$sound_object.set_sound(b1_stream)


func get_tile_type() -> int:
	return GlobalVariables.Kick
