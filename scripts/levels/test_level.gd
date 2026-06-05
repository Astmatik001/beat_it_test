class_name test_level
extends level

var tiles = 20
var number_of_spaces = 16

func _ready() -> void:
	var spaces = $score_calc/movement_machine/space_dispencer.generate_spaces(number_of_spaces)
	$score_calc/movement_machine/button_dispencer.generate_tiles(tiles)
	$score_calc.create_scene(spaces)
	


func _on_play_button_button_down() -> void:
	$score_calc/Playbacker.global_position = Vector2(-450, -160)
	GlobalVariables.toggle_playbacking()
	$score_calc.reset_score()


func _on_reroll_button_button_down() -> void:
	$score_calc/movement_machine/button_dispencer.reroll_tiles()

func pass_items(items: Array[item]) -> void:
	$score_calc.items = items

func pass_tiles(tiles: Array[movement_tile]) -> void:
	pass

func end_level() -> void:
	queue_free()
