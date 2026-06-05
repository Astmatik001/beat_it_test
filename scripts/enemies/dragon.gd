class_name dragon
extends enemy


func _ready() -> void:
	position = Vector2(0, -200)
	scale = Vector2(0.4,0.2)

func affect_spaces(tiles: Array[space_tile]) -> void:
	#for tile in tiles:
		#tile.state = rand
	pass
