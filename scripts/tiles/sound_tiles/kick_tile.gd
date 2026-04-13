class_name kick_tile
extends sound_tile

var b1_stream = preload("res://streams/b1_stream.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$sound_object.set_sound(b1_stream)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if follow_mouse: position = get_global_mouse_position()


func get_tile_subtype() -> String:
	return "kick"
