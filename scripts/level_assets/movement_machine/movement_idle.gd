class_name movement_idle
extends movement_state


func process_input(event) -> void:
	if (event is InputEventMouseButton 
	and event.button_index == MOUSE_BUTTON_LEFT 
	and event.pressed):
		if GlobalVariables.playbacking: 
			return
		if machine.try_pick_tile():
			machine.start_drag()
	
