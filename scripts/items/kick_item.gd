class_name kick_item
extends item

var description = '''
Kicks count one more time
'''
func get_description() -> String:
	return description

func modify_sound_count(counts: Dictionary) -> void:
	if counts[Global.tiles.KICK]:
		counts[Global.tiles.KICK] += 1

func get_type() -> int:
	return Global.item_types.AMULET
