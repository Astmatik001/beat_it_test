class_name Score
extends Node

var score: Vector3i:
	get: return score
	set(value): 
		score = value

var beat:
	get: return score.x
	set(value): score.x = value
var engine:
	get: return score.y
	set(value): score.y = value
var constant:
	get: return score.z
	set(value): score.z = value

func _ready() -> void:
	score = Vector3i(0, 0, 0)

func reset() -> void:
	score = Vector3i(0, 0, 0)
