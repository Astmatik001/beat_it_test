extends Node2D
class_name Mouse

func _process(_delta: float) -> void:
	position = get_global_mouse_position()
