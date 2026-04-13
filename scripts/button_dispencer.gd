extends Node
class_name button_dispencer

var kick = preload("res://scenes/tiles/sound_tiles/kick_tile.tscn")
var snare = preload("res://scenes/tiles/sound_tiles/snare_tile.tscn")
var hi_hat = preload("res://scenes/tiles/sound_tiles/hi_hat_tile.tscn")

var loud = preload("res://scenes/tiles/modificator_tiles/loud_tile.tscn")
var quiet = preload("res://scenes/tiles/modificator_tiles/quiet_tile.tscn")
var long = preload("res://scenes/tiles/modificator_tiles/long_tile.tscn")
var short = preload("res://scenes/tiles/modificator_tiles/short_tile.tscn")

var tile_array = [kick, snare, hi_hat,  loud, quiet, long, short]

func _ready() -> void:
	SignalBus.bring_it_back.connect(_on_bring_it_back)

func generate_tiles(number: int):
	for i in range(0,number):
		var _tile: movement_tile
		var _choice = tile_array.pick_random()
		_tile = _choice.instantiate()
		add_child(_tile)
		_tile.default_position = Vector2(i*50 - 400, 100)
		_tile.reset_position()
		if _tile is sound_tile:
			_tile.bring_it_back.connect(_on_bring_it_back)

func reroll_tiles():
	for _tile in get_children():
		if _tile is space_tile: continue
		
		var pos = _tile.default_position
		var new_tile = tile_array.pick_random().instantiate()
		new_tile.default_position = pos
		add_child(new_tile)
		new_tile.reset_position()
		_tile.queue_free()

func move_child_tile(modificator: modificator_tile, sound: sound_tile):
	remove_child(modificator)
	sound.add_modificator_child(modificator)
	
func _on_bring_it_back(who: movement_tile):
	add_child(who)
	who.reset_position()
