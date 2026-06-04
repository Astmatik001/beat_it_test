class_name movement_dragging
extends movement_state

func process_input(event):
	if (event is InputEventMouseButton 
	and event.button_index == MOUSE_BUTTON_LEFT 
	and not event.pressed):
		if machine.try_get_destination():
			if machine.follower is sound_tile and machine.destination is space_tile:
				machine.set_follower_to_destination()
			elif machine.follower is modificator_tile:
				machine.set_follower_to_destination()
			else:
				machine.release_drag()
		else:
			machine.release_drag()
		machine.change_state("idle")
