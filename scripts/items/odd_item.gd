class_name odd_item
extends item

var description = '''
Odd tiles count one more time
'''
func get_description() -> String:
	return description

func modify_space_count(counts: Array[int]) -> void:
	for i in len(counts):
		if i%2:
			counts[i] += 1

func get_type() -> int:
	return Global.item_types.ACCESEORY
