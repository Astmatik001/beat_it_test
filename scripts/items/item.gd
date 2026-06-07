@abstract class_name item
extends Area2D


@abstract func get_description() -> String
@abstract func get_type() -> Global.item_types

func modify_score(_score: Score) -> void:
	pass

func modify_sound_count(_counts: Dictionary) -> void:
	pass

func modify_space_count(_counts: Array[int]) -> void:
	pass


func _ready() -> void:
	input_event.connect(_on_input_event)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
	_label= Label.new()
	_label.text = get_description()
	_label.position = Vector2(-50,-70)
	_label.visible = false
	add_child(_label)

signal ive_been_clicked(_item: item)
signal ive_been_entered(_item: item)
signal ive_been_exited(_item: item)

func _on_input_event(viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			ive_been_clicked.emit(self)
			viewport.set_input_as_handled()

var _label: Label
func show_description() -> void:
	_label.visible = true
	
func hide_description() -> void:
	_label.visible = false
	
func _on_mouse_entered() -> void:
	show_description()
	ive_been_entered.emit(self)

func _on_mouse_exited() -> void:
	hide_description()
	ive_been_exited.emit(self)
