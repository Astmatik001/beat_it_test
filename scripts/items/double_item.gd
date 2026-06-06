class_name double_item
extends item

var description = '''
Doubles all score
'''
func get_description() -> String:
	return description

func modify_score(score: Score) -> void:
	score.score *= 2

func get_type() -> int:
	return Global.item_types.AMULET
