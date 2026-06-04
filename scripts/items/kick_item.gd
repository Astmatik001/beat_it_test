class_name kick_item
extends item

var description = '''
Kicks count one more time
'''
func get_description() -> String:
	return description

func modify_sound_count(counts: Dictionary) -> void:
	if counts[GlobalVariables.Kick]:
		counts[GlobalVariables.Kick] += 1
