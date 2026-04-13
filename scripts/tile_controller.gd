class_name tile_controller
extends Control


signal im_being_released()
func release():
	var child = get_child(0)
	remove_child(child)
	im_being_released.emit()
	SignalBus.bring_it_back.emit(child)
	queue_free()

func _on_release_me():
	release()
	pass
	
func connect_to_child():
	get_child(0).release_me.connect(_on_release_me)
	pass

func get_child_subtype() -> String:
	return get_child(0).get_tile_subtype()
	
