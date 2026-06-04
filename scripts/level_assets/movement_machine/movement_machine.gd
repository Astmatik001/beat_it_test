extends Node2D
class_name movement_machine

var idle := preload("res://scripts/level_assets/movement_machine/movement_idle.gd").new()
var dragging := preload("res://scripts/level_assets/movement_machine/movement_dragging.gd").new()

var states = {
		"idle": idle,
		"dragging": dragging,
	}
var current_state: movement_state

var destination: tile
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
	
func get_downward_collisions(pos: Vector2) -> Dictionary:
	var params = PhysicsRayQueryParameters2D.new()
	params.set_collide_with_areas(true)
	params.set_from(pos)
	params.set_to(pos + Vector2(0, 500))
	return get_world_2d().direct_space_state.intersect_ray(params)
	

func try_pick_tile() -> bool:
	var results = get_point_collisions(get_global_mouse_position())
	for result in results:
		var collider = result.collider
		if collider:
			if collider is movement_tile:
				follower = collider
				return true
	return false
	
func try_get_destination() -> tile:
	var result = get_downward_collisions(get_global_mouse_position())
	if result:
		var collider = result["collider"]
		if collider is tile:
			destination = collider
			return collider
	return null
	
func start_drag() -> void:
	if follower is sound_tile:
		follower.play_my_sound()
	follower.reparent($"Mouse")
	follower.position = Vector2(0,0)
	change_state("dragging")
	
#func update_drag_position() -> void:
	#follower.set_position(get_global_mouse_position())

func release_drag() -> void:
	#var next: movement_tile = follower
	#while next != null:
		#next.reparent($button_dispencer)
		#next.reset_position()
		#for child in next.get_children():
			#if child is movement_tile:
				#next = child
				#continue
		#next = null
	follower.reparent($button_dispencer)
	follower.reset_position()

#func place_sound() -> void:
	#$button_dispencer.remove_child(follower)
	#destination.add_sound_child(follower)
	#follower.set_position(Vector2(0,0))
#
#func place_modificator() -> void:
	#var order = destination.get_mouse_position()
	#$button_dispencer.move_child_tile(follower, destination.get_sound_tile(), order)

func set_follower_to_destination() -> void:
	print(follower, destination)
	follower.reparent(destination)
	follower.position = Vector2(0, -30)
