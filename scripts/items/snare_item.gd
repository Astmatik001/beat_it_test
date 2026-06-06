class_name snare_item
extends item

var description = '''
Snares count one more time
'''
func get_description() -> String:
	return description

func modify_sound_count(counts: Dictionary) -> void:
	if counts[Global.tiles.SNARE]:
		counts[Global.tiles.SNARE] += 1 

func get_type() -> int:
	return Global.item_types.AMULET
