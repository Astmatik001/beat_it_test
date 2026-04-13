class_name impact_tile
extends modificator_tile


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if follow_mouse: position = get_global_mouse_position()

func get_tile_subtype() -> String:
	return("impact")
