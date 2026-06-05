extends Node
class_name space_dispencer

var space = preload("res://scenes/tiles/space_tile.tscn")


func generate_spaces(number: int) -> Array[space_tile]:
	var _arr: Array[space_tile] = []
	for i in range(0,number):
		var _tile = space.instantiate()
		_tile.id = i
		add_child(_tile)
		_arr.append(_tile)
		_tile.set_position(Vector2(i*50 - 400, -100))
	return _arr
