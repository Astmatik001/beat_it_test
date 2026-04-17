@abstract class_name sound_tile
extends movement_tile


func play_my_sound() -> void:
	$sound_object.reset()
	for controller in $controller_container.get_children():
		controller.get_child(0).modify_sound($sound_object)
	$sound_object.play_my_sound()

func clear_controller_container():
	for child in $controller_container.get_children():
		child.release()

func add_modificator_child(modificator: modificator_tile, order: int):
	$controller_container.add_modificator_child(modificator, order)

func get_modifiers() -> Array[modificator_tile]:
	var mod_arr: Array[modificator_tile] = []
	for controller in $controller_container.get_children():
		mod_arr.append(controller.get_child(0))
	return mod_arr

func count_score() -> Score:
	var score = Score.new()
	var modifiers = get_modifiers()
	for modifier in modifiers:
		modifier.modify_score(score)
	return score
