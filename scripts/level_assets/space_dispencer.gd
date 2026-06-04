extends Node
class_name space_dispencer

var space = preload("res://scenes/tiles/space_tile.tscn")


func generate_spaces(number: int):
	for i in range(0,number):
		var _tile = space.instantiate()
		add_child(_tile)
		_tile.set_position(Vector2(i*50 - 400, -100))
