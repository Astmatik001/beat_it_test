extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.score_update.connect(_on_score_update)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_score_update(beat: int, engine: int, constant: int):
	$beat_display.update_score(beat)
	$engine_display.update_score(engine)
	$constant_display.update_score(constant)
	pass
