@abstract class_name item
extends Area2D


@abstract func get_description() -> String

func modify_score(_score: Score) -> void:
	pass

func modify_sound_count(_counts: Dictionary) -> void:
	pass

func modify_space_count(_counts: Array[int]) -> void:
	pass

signal ive_been_clicked(item)

func _on_input_event(viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			ive_been_clicked.emit(self)
			viewport.set_input_as_handled()
	
