@abstract class_name movement_tile
extends tile

var follow_mouse: bool
var default_position: Vector2

func _init():
	follow_mouse = false

func _process(_delta: float) -> void:
	if follow_mouse: position = get_global_mouse_position()

func toggle_follow_mouse():
	follow_mouse = not follow_mouse
func get_default_position() -> Vector2:
	return default_position
func set_default_position(new_position: Vector2):
	default_position = new_position

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == 1:
			toggle_follow_mouse()
			if not SignalBus.playbacking:
				play_my_sound()
			SignalBus.mouse_button_clicked.emit(self)

func reset_position() -> void:
	position = default_position

func get_tile_type() -> String:
	return "movement_tile"

@warning_ignore("unused_signal")
signal release_me()

func play_my_sound():
	pass
