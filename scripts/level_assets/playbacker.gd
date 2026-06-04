class_name playbacker
extends Area2D

signal reached_the_end()

func _process(_delta: float) -> void:
	if GlobalVariables.playbacking:
		if(position.x >= 350):
			set_position(Vector2(-450, -160))
			reached_the_end.emit()
		# playback speed in the vector
		translate(Vector2(4,0))

func _on_area_entered(area: Area2D) -> void:
	if area is sound_tile and GlobalVariables.playbacking:
		SignalBus.thing_entered_playbacker.emit(area, position.x)
		area.play_my_sound()
		
