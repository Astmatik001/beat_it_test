@abstract class_name sound_tile
extends movement_tile



func play_my_sound() -> void:
	var folowers = get_followers()
	$sound_object.reset()
	for folower in folowers:
		match folower:
			"loud":
				$sound_object.loud = true
			"quiet":
				$sound_object.quiet = true
			"long":
				$sound_object.long = true
			"short":
				$sound_object.short = true
			_:
				pass
	$sound_object.play_my_sound()


func get_tile_type() -> String:
	return "sound_tile"

func clear_controller_container():
	for child in $controller_container.get_children():
		child.release()

func add_modificator_child(modificator: modificator_tile):
	$controller_container.add_modificator_child(modificator)

signal bring_it_back(who: modificator_tile)
func _on_controller_container_bring_it_back(who: modificator_tile) -> void:
	bring_it_back.emit(who)

func get_followers() -> Array:
	var arr = []
	for controller in $controller_container.get_children():
		arr.append(controller.get_child_subtype())
	return arr
