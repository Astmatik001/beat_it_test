extends Node
class_name movement_and_snapping

func _ready() -> void:
	SignalBus.mouse_button_clicked.connect(_on_mouse_button_clicked)
	SignalBus.new_destination.connect(_on_new_destination)

var destination: space_tile
var follower: movement_tile
func _on_mouse_button_clicked(thing: Node2D) -> void:
	follower = thing
	thing.release_me.emit()
func _on_new_destination(place: Area2D) -> void:
	destination = place

func toggle_modificator_follow_on(modificator: modificator_tile, sound: sound_tile, order: int):
	$button_dispencer.move_child_tile(modificator, sound, order)
	
func _input(event: InputEvent):
	if event is InputEventMouseButton and not event.pressed and event.button_index == 1:
		if follower != null:
			if destination != null:
				if follower is sound_tile:
					if destination.is_getting_followed(): follower.reset_position()
					else: 
						$button_dispencer.remove_child(follower)
						destination.add_sound_child(follower)
						follower.position = Vector2(0,0)
				elif follower is modificator_tile:
					if destination.is_getting_followed():
						#var followers = destination.get_follower().get_follower_types()
						#if follower.get_tile_subtype() in followers:
							#follower.reset_position()
						#else:
						
						var order = destination.get_mouse_position()
						print(order)
						toggle_modificator_follow_on(follower, destination.get_sound_tile(), order)
					else:
						follower.reset_position()
			else:
				follower.reset_position()
				if follower is sound_tile:
					follower.clear_controller_container()
					
			follower.follow_mouse = false
			follower = null
