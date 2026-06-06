class_name hi_hat_item
extends item

var description = '''
Hi_hats count one more time
'''
func get_description() -> String:
	return description

func modify_sound_count(counts: Dictionary) -> void:
	if counts[Global.tiles.HIHAT]:
		counts[Global.tiles.HIHAT] += 1

func get_type() -> int:
	return Global.item_types.ACCESEORY
