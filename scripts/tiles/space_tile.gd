extends tile
class_name space_tile


func _on_mouse_entered() -> void:
	SignalBus.new_destination.emit(self)
func _on_mouse_exited() -> void:
	SignalBus.new_destination.emit(null)

func get_sound_tile() -> sound_tile:
	var areas = get_overlapping_areas()
	for area in areas:
		if area is sound_tile:
			return area
	return null
	

func get_tile_type() -> int:
	return GlobalVariables.Space

func add_sound_child(child: sound_tile):
	add_child(child)
	child.release_me.connect(_on_release_me)

func _on_release_me():
	var child: sound_tile = get_child(2)
	#var modifiers = child.get_modifiers()
	child.release_me.disconnect(_on_release_me)
	remove_child(child)
	SignalBus.bring_it_back.emit(child)
	#for mod in modifiers:
		#SignalBus.bring_it_back.emit(mod)
		

func is_getting_followed() -> bool:
	if get_children().size() > 2:
		return true
	else:
		return false

func get_follower() -> sound_tile:
	return get_child(2)

func get_mouse_position() -> int:
	var local_pos = get_local_mouse_position()
	if local_pos.y > -32:
		return -1
	return local_pos.y/32 - 1
