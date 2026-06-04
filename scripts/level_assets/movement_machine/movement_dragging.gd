class_name movement_dragging
extends movement_state

func enter():
	machine.start_drag()

func process_input(event):
	if event is InputEventMouseMotion:
		machine.update_drag_position()

	elif (event is InputEventMouseButton 
	and event.button_index == MOUSE_BUTTON_LEFT 
	and not event.pressed):
		if machine.try_get_destination():
			if machine.follower is sound_tile:
				if machine.destination.is_getting_followed(): machine.release_drag()
				else: 
					machine.place_sound()
			elif machine.follower is modificator_tile:
				if machine.destination.is_getting_followed(): 
					machine.place_modificator()
				else:
					machine.release_drag()
		else:
			machine.release_drag()
		machine.change_state("idle")
			
			
			#if machine.try_drop():
				#machine.set_state("idle")
			#else:
				#machine.cancel_drag()
				#machine.set_state("idle")
