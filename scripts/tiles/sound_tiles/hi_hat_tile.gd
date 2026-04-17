class_name hi_hat_tile
extends sound_tile

var t1_stream = preload("res://streams/t1_stream.tres")

func _ready() -> void:
	$sound_object.set_sound(t1_stream)

func get_tile_type() -> int:
	return GlobalVariables.HiHat

func count_score() -> Score:
	var score = super()
	score.constant += 1
	return score
