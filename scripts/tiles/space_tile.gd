extends tile
class_name space_tile

var occupied = false

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
	occupied = true

func _on_release_me():
	var child: sound_tile = get_child(2)
	child.release_me.disconnect(_on_release_me)
	remove_child(child)
	SignalBus.bring_it_back.emit(child)
	occupied = false

func is_getting_followed() -> bool:
	return occupied

func get_follower() -> sound_tile:
	return get_child(2)

func get_mouse_position() -> int:
	var local_pos = get_local_mouse_position()
	if local_pos.y > -32:
		return -1
	return local_pos.y/32 - 1

func modify_score() -> void:
	pass
