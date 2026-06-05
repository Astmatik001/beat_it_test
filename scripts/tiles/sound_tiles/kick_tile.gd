class_name kick_tile
extends sound_tile

var b1_stream = preload("res://streams/b1_stream.tres")

func _ready() -> void:
	$sound_object.set_sound(b1_stream)

func get_tile_type() -> int:
	return GlobalVariables.Kick

func modify_score(score: Score) -> void:
	score.beat += 1
