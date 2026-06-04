extends Node2D


func score_update(score: Score):
	$beat_display.update_score(score.beat)
	$engine_display.update_score(score.engine)
	$constant_display.update_score(score.constant)
