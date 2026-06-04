extends Node2D
class_name movement_machine

var idle := preload("res://scripts/level_assets/movement_machine/movement_idle.gd").new()
var dragging := preload("res://scripts/level_assets/movement_machine/movement_dragging.gd").new()

var states = {
		"idle": idle,
		"dragging": dragging,
	}
var current_state: movement_state

var destination: space_tile
var follower: movement_tile

func _ready() -> void:
	change_state("idle")

func _unhandled_input(event):
	current_state.process_input(event)

func change_state(state: String) -> void:
	if current_state:
		current_state.exit()
	current_state = states[state]
	current_state.machine = self
	current_state.enter()
	
func get_point_collisions(pos: Vector2) -> Array[Dictionary]:
	var params = PhysicsPointQueryParameters2D.new()
	params.set_collide_with_areas(true)
	params.set_position(pos)
	return get_world_2d().direct_space_state.intersect_point(params)
	
func try_pick_tile() -> bool:
	var results = get_point_collisions(get_global_mouse_position())
	for result in results:
		var collider = result.collider
		if collider:
			if collider is movement_tile:
				follower = collider
				return true
	return false
	
func try_get_destination() -> space_tile:
	var results = get_point_collisions(get_global_mouse_position())
	for result in results:
		var collider = result.collider
		if collider:
			if collider is space_tile:
				destination = collider
				return collider
	return null
	
func start_drag() -> void:
	if follower is sound_tile:
		follower.play_my_sound()
	follower.release_me.emit()
	update_drag_position()
	
func update_drag_position() -> void:
	follower.set_position(get_global_mouse_position())

func release_drag() -> void:
	follower.reset_position()
	if follower is sound_tile:
		follower.clear_controller_container()

func place_sound() -> void:
	$button_dispencer.remove_child(follower)
	destination.add_sound_child(follower)
	follower.set_position(Vector2(0,0))

func place_modificator() -> void:
	var order = destination.get_mouse_position()
	$button_dispencer.move_child_tile(follower, destination.get_sound_tile(), order)
	
