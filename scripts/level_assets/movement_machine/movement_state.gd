@abstract class_name movement_state
extends Node2D

var machine: movement_machine:
	set(node): machine = node

func enter():
	pass
func exit():
	pass

@abstract func process_input(event) -> void
