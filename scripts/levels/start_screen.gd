class_name start_screen
extends Node2D
var run_path = preload("res://scenes/levels/run.tscn")

func _on_button_pressed() -> void:
	var _run = run_path.instantiate()
	_run.target_level = LevelLibrary.levels.TEST
	get_tree().root.add_child(_run)
	get_tree().current_scene = _run
	queue_free()

func _on_button_2_pressed() -> void:
	var _run = run_path.instantiate()
	_run.target_level = LevelLibrary.levels.BATTLE_LEVEL
	get_tree().root.add_child(_run)
	get_tree().current_scene = _run
	queue_free()
