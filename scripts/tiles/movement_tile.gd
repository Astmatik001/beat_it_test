@abstract class_name movement_tile
extends tile

var default_position: Vector2

func get_default_position() -> Vector2:
	return default_position

func set_default_position(new_position: Vector2):
	default_position = new_position

func reset_position() -> void:
	position = default_position

func get_stack() -> Array[movement_tile]:
	var _stack: Array[movement_tile]
	for child in get_children():
		if child is tile:
			_stack	= child.get_stack()
	_stack.append(self)
	return _stack

func modify_score(_score: Score) -> void:
	pass
