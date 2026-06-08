class_name run
extends Node2D

var current_hero: hero
var target_level: LevelLibrary.levels :
	set(value):
		target_level = value
var current_level: level

func _ready() -> void:
	create_hero(HeroLibrary.heroes.GUY)
	Global.rng.seed= randi()
	current_level = load_level(LevelLibrary.level_scenes[target_level])

func load_level(path: String):
	if current_level:
		current_level.queue_free()
	var _level = load(path)
	var level_instance: level = _level.instantiate()
	if level_instance is test_item_chooser:
		level_instance.item_chosen.connect(_on_item_chosen) 
		level_instance.clone_clicked.connect(_on_locked_item_chosen)
		level_instance.current_hero = current_hero
	add_child(level_instance)
	level_instance.pass_items(current_hero.get_items())
	return level_instance
	
func create_hero(_hero: int) -> void:
	current_hero = load(HeroLibrary.hero_scenes[_hero]).instantiate()
	add_child(current_hero)
	current_hero.position = Vector2(-400, 200)
	
func _on_item_chosen(_item: item):
	var part = current_hero.try_pick_place(_item)
	if part:
		current_hero.place_item(_item, part)
		current_level.pass_items(current_hero.get_items())
		current_level.create_chooser()
	else:
		current_level.lock_choise()

func _on_locked_item_chosen(_item: item, part: body_part):
		current_hero.place_item(_item, part)
		current_level.create_chooser()
