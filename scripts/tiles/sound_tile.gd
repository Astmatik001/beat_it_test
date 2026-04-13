@abstract class_name sound_tile
extends movement_tile


func play_my_sound() -> void:
	$sound_object.reset()
	for controller in $controller_container.get_children():
		controller.get_child(0).modify_sound($sound_object)
	$sound_object.play_my_sound()


func get_tile_type() -> String:
	return "sound_tile"

func clear_controller_container():
	for child in $controller_container.get_children():
		child.release()

func add_modificator_child(modificator: modificator_tile, order: int):
	$controller_container.add_modificator_child(modificator, order)

signal bring_it_back(who: modificator_tile)
func _on_controller_container_bring_it_back(who: modificator_tile) -> void:
	bring_it_back.emit(who)

#func get_follower_types() -> Array:
	#var arr = []
	#for controller in $controller_container.get_children():
		#arr.append(controller.get_child_subtype())
	#return arr
