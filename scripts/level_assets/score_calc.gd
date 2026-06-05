extends Node

var spaces: Array[space_tile]
var score = Score.new()
var space_counts: Array[int] = []
var sound_counts: Dictionary = {}
var items: Array[item] = []:
	set(value):
		items = value
		reset_counts()
		for _item in items:
			pass
			_item.modify_space_count(space_counts)
			_item.modify_sound_count(sound_counts)

func _ready() -> void:
	$Playbacker.space_entered_playbacker.connect(_on_space_entered_playbacker)

func _on_space_entered_playbacker(space: space_tile):
	add_space_score(space)

func create_scene(_spaces: Array[space_tile]):
	spaces = _spaces
	reset_counts()
	reset_score()

func reset_counts():
	space_counts.resize(len(spaces))
	space_counts.fill(1)
	sound_counts[GlobalVariables.Kick] = 1
	sound_counts[GlobalVariables.HiHat] = 1
	sound_counts[GlobalVariables.Snare] = 1
#
func reset_score():
	score.reset()

#func calculate_total_score():
	#reset_score()
	#for space in spaces:
		#add_space_score(space)
	#$MultiScoreDisplay.score_update(score)
	
func add_space_score(space: space_tile):
	var s = space.count_score()
	score.score += s.score
	$MultiScoreDisplay.score_update(score)

func _on_playbacker_reached_the_end() -> void:
	reset_score()

func _on_play_button_button_down() -> void:
	$Playbacker.global_position = Vector2(-450, -160)
	GlobalVariables.toggle_playbacking()
	reset_score()
