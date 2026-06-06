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
	pass

func generate_tiles(number: int):
	for i in range(0,number):
		var _tile: movement_tile
		var _choice = tile_array[Global.rng.randi_range(0,len(tile_array) - 1)]
		_tile = _choice.instantiate()
		add_child(_tile)
		_tile.default_position = Vector2(i*50 - 400, 100)
		_tile.reset_position()

func reroll_tiles():
	for _tile in get_children():
		if _tile is movement_tile:
			if not _tile.is_getting_followed():
				var pos = _tile.default_position
				var new_tile = tile_array[Global.rng.randi_range(0,len(tile_array) - 1)].instantiate()
				new_tile.default_position = pos
				add_child(new_tile)
				new_tile.reset_position()
				_tile.queue_free()


func _on_reroll_button_button_down() -> void:
	reroll_tiles()
