extends Node

func _process(_delta: float) -> void:
	pass


@warning_ignore("unused_signal")
signal mouse_button_clicked(object: Node2D)
@warning_ignore("unused_signal")
signal new_destination(where: Node2D)
