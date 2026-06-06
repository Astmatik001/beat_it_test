class_name run
extends Node2D

var current_hero: hero
var chooser = preload("res://scenes/items/item_chooser.tscn")
var target_level: int :
	set(value):
		target_level = value
var current_level: level

func _ready() -> void:
	create_hero(HeroLibrary.heroes.GUY)
	Global.rng.seed= randi()
	current_level = load_level(LevelLibrary.level_scenes[target_level])
	create_chooser()

func load_level(path: String):
	if current_level:
		current_level.queue_free()
	var _level = load(path)
	var level_instance = _level.instantiate()
	add_child(level_instance)
	level_instance.pass_items(current_hero.items)
	return level_instance

func create_chooser() -> void:
	var _chooser = chooser.instantiate()
	_chooser.item_chosen.connect(_on_item_chosen)
	add_child(_chooser)
	
func _on_item_chosen(_item: item) -> void:
	current_hero.place_item(_item)
	current_level.pass_items(current_hero.items)
	#create_chooser()
	
func create_hero(_hero: int) -> void:
	current_hero = load(HeroLibrary.hero_scenes[_hero]).instantiate()
	add_child(current_hero)
	current_hero.position = Vector2(-400, 200)
