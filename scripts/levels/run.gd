class_name run
extends Node2D


var items: Array[item] = []
var chooser = preload("res://scenes/items/item_chooser.tscn")
var current_level
func _ready() -> void:
	current_level = load_level(LevelLibrary.test)
	create_chooser()

func load_level(path: String) -> test_level:
	var _level = load(path)
	var level_instance = _level.instantiate()
	add_child(level_instance)
	level_instance.pass_items(items)
	return level_instance

func create_chooser() -> void:
	var _chooser = chooser.instantiate()
	_chooser.item_chosen.connect(_on_item_chosen)
	add_child(_chooser)
	
func _on_item_chosen(_item: item) -> void:
	var control = Control.new()
	$HBoxContainer.add_child(control)
	items.append(_item)
	control.add_child(_item)
	current_level.pass_items(items)
	create_chooser()
