class_name controller_container
extends VBoxContainer

var controller = preload("res://scenes/tile_controller.tscn")

var offset = Vector2 (0, -29)

func _on_controller_im_being_released():
	position -= offset

func add_modificator_child(modificator: modificator_tile, order: int):
	
	var _controller = controller.instantiate()
	_controller.custom_minimum_size = Vector2(20,25)
	position += offset
	add_child(_controller)
	_controller.add_child(modificator)
	move_child(_controller, order)
	modificator.position = Vector2(0,0)
	_controller.im_being_released.connect(_on_controller_im_being_released)
	_controller.connect_to_child()
