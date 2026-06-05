class_name battle_level
extends level

var number_of_tiles = 20
var number_of_spaces = 16

var level_enemy: enemy
var spaces: Array[space_tile]

func _ready() -> void:
	spaces = $movement_machine/space_dispencer.generate_spaces(number_of_spaces)
	$movement_machine/button_dispencer.generate_tiles(number_of_tiles)
	level_enemy = load(EnemyLibrary.random_enemy()).instantiate()
	add_child(level_enemy)
	level_enemy.affect_spaces(spaces)
	#spawn playbacker and button
	pass

func pass_items(items: Array[item]) -> void:
	$score_calc.items = items
func pass_tiles(tiles: Array[movement_tile]) -> void:
	pass
func end_level() -> void:
	queue_free()
