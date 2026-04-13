extends Node2D



var tiles = 20
var spaces = 16

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$movement_and_snapping/space_dispencer.generate_spaces(spaces)
	$movement_and_snapping/button_dispencer.generate_tiles(tiles)
	SignalBus.created_scene.emit(tiles, spaces)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if SignalBus.playbacking:
		if($Playbacker.position.x >= 350):
			$Playbacker.set_position(Vector2(-450, -160))
			SignalBus.created_scene.emit(tiles, spaces)
		# playback speed in the vector
		$Playbacker.translate(Vector2(4,0))


func _on_play_button_button_down() -> void:
	$Playbacker.global_position = Vector2(-450, -160)
	SignalBus.toggle_playbacking()
	SignalBus.created_scene.emit(tiles, spaces)


func _on_reroll_button_button_down() -> void:
	$movement_and_snapping/button_dispencer.reroll_tiles()
