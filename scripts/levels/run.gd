class_name run
extends Node2D


var items: Array[item] = []
var chooser = preload("res://scenes/items/item_chooser.tscn")
var target_level: int :
	set(value):
		target_level = value
var current_level: level

func _ready() -> void:
	GlobalVariables.rng.seed= randi()
	current_level = load_level(LevelLibrary.level_scenes[target_level])
	create_chooser()

func load_level(path: String):
	if current_level:
		current_level.queue_free()
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
	#create_chooser()
