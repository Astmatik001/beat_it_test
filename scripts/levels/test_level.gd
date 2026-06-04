class_name test_level
extends Node2D

var tiles = 20
var spaces = 16

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$score_calc/movement_machine/space_dispencer.generate_spaces(spaces)
	$score_calc/movement_machine/button_dispencer.generate_tiles(tiles)
	$score_calc.create_scene(spaces)


func _on_play_button_button_down() -> void:
	$score_calc/Playbacker.global_position = Vector2(-450, -160)
	GlobalVariables.toggle_playbacking()
	$score_calc.reset_scene()


func _on_reroll_button_button_down() -> void:
	$score_calc/movement_machine/button_dispencer.reroll_tiles()

func pass_items(items: Array[item]) -> void:
	$score_calc.items = items
