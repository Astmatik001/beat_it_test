extends Node

var number_of_tiles: int
var number_of_spaces: int
var field = Array([],TYPE_ARRAY, "", null)

func _ready() -> void:
	SignalBus.created_scene.connect(_on_created_scene)
	SignalBus.thing_entered_playbacker.connect(_on_thing_entered_playbacker)

func _process(_delta: float) -> void:
	pass

func _on_thing_entered_playbacker(thing: Node2D, pos: int):
	var space_id: int
	@warning_ignore("integer_division")
	space_id = (pos + 450)/50
	match thing.get_tile_subtype():
		"kick":
			field[space_id][0] = 1
			calculate_score()
		"snare":
			field[space_id][0] = 2
			calculate_score()
		"hi_hat":
			field[space_id][0] = 3
			calculate_score()
		"sound_tile":
			print("wtf something wrong it says it is sound tile")
		"space_tile":
			pass
		_:
			print(thing.get_tile_type())

func _on_created_scene(tiles: int, spaces: int):
	number_of_tiles = tiles
	number_of_spaces = spaces
	field.clear()
	field.resize(spaces)
	for i in range(0, spaces):
		field[i] = Array([], TYPE_INT, "", null)
		field[i].resize(1)
		field[i][0] = 0
	calculate_score()

func calculate_score():
	var point_scales = [0, 0, 0, 0]
	for i in range(0, number_of_spaces):
		point_scales[field[i][0]] += 1
	SignalBus.score_update.emit(point_scales[1], point_scales[2], point_scales[3])
