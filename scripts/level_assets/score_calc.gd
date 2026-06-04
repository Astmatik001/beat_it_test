extends Node

var number_of_spaces: int: 
	set(value):
		number_of_spaces = value

var score = Score.new()
var tiles: Array[sound_tile] = []
var space_counts: Array[int] = []
var sound_counts: Dictionary = {}
var items: Array[item] = []:
	set(value):
		items = value
		reset_counts()
		for _item in items:
			_item.modify_space_count(space_counts)
			_item.modify_sound_count(sound_counts)

func _ready() -> void:
	SignalBus.thing_entered_playbacker.connect(_on_thing_entered_playbacker)

func _on_thing_entered_playbacker(thing: Node2D, pos: int):
	var space_id: int
	@warning_ignore("integer_division")
	space_id = (pos + 450)/50
	tiles[space_id] = thing
	calculate_score()

func create_scene(number: int):
	number_of_spaces = number
	tiles.clear()
	tiles.resize(number_of_spaces)
	reset_scene()
	reset_counts()

func reset_counts():
	space_counts.resize(number_of_spaces)
	space_counts.fill(1)
	sound_counts[GlobalVariables.Kick] = 1
	sound_counts[GlobalVariables.HiHat] = 1
	sound_counts[GlobalVariables.Snare] = 1

func reset_scene():
	for i in range(0, number_of_spaces):
		tiles[i] = null	
	calculate_score()

func calculate_score():
	score.reset()
	for i in range(0, number_of_spaces):
		if tiles[i]:
			for j in space_counts[i]:
				for k in sound_counts[tiles[i].get_tile_type()]:
					var s = Score.new()
					s = tiles[i].count_score()
					for _item in items:
						_item.modify_score(s)
					score.score += s.score
	$MultiScoreDisplay.score_update(score)

func _on_playbacker_reached_the_end() -> void:
	reset_scene()
