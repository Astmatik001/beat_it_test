extends tile
class_name space_tile

var id: int:
	set(value):
		id = value

func get_tile_type() -> int:
	return Global.tiles.SPACE

func get_sound_tile() -> sound_tile:
	for child in get_children():
		if child is sound_tile:
			return child
	return null

func count_score(sound_counts: Dictionary) -> Score:
#	state.count_score
	var score = Score.new()
	var sound = get_sound_tile()
	if sound:
		for i in sound_counts[sound.get_tile_type()]:
			var stack = sound.get_stack()
			for _item in stack:
				_item.modify_score(score)
	return score
