class_name item_chooser
extends Control

var current_hero: hero
func _ready() -> void:
	generate_items()

func generate_items() -> void:
	for _container in $HBoxContainer.get_children():
		var part = _container.get_child(0)
		var _item: item
		var rng_item = Global.rng.randi_range(0,len(ItemLibrary.items) - 1)
		_item = load(ItemLibrary.item_scenes[rng_item]).instantiate()
		_item.collision_layer = 5
		_item.ive_been_clicked.connect(_on_item_clicked)
		_item.ive_been_entered.connect(_on_item_entered)
		_item.ive_been_exited.connect(_on_item_exited)
		part.add_child(_item)

signal item_chosen(item)

func _on_item_clicked(_item: item):
	item_chosen.emit(_item)

func release():
	if _slot_center_control:
		_slot_center_control.queue_free()
	queue_free()

func lock_choise():
	locked = true

var current_displayed_item: item
var _slot_center_control: CenterContainer
var locked: bool = false

func _on_item_entered(_item: item):
	if not locked:
		show_equipped(_item)

func _on_item_exited(_item: item):
	if not locked:
		hide_equipped(_item)

func show_equipped(_item: item):
	current_displayed_item = _item
	if _slot_center_control:
		_slot_center_control.queue_free()
	
	_slot_center_control = CenterContainer.new()
	_slot_center_control.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_item.add_child(_slot_center_control)
	_slot_center_control.position = Vector2(-50, 50)
	_slot_center_control.size = Vector2(100, 50)

	var slot_container = HBoxContainer.new()
	slot_container.alignment = BoxContainer.ALIGNMENT_CENTER
	_slot_center_control.add_child(slot_container)

	var parts: Dictionary
	match _item.get_type():
		Global.item_types.HAT:
			parts = current_hero.body[Global.body_parts.HEAD]
		Global.item_types.AMULET:
			parts = current_hero.body[Global.body_parts.NECK]
		Global.item_types.WEAPON:
			parts = current_hero.body[Global.body_parts.ARM]
		Global.item_types.ARMOR:
			parts = current_hero.body[Global.body_parts.BODY]
		Global.item_types.PANTS:
			parts = current_hero.body[Global.body_parts.LEGS]
		Global.item_types.SHOES:
			parts = current_hero.body[Global.body_parts.FEET]
	for part in parts:
		var _center_container = CenterContainer.new()
		_center_container.custom_minimum_size = Vector2(30,30)
		slot_container.add_child(_center_container)
		var _color_square = ColorRect.new()
		_color_square.color = Color(0.2, 0.2, 0.2)
		_color_square.custom_minimum_size = Vector2(30,30)
		_center_container.add_child(_color_square)
		var clone = part.duplicate()
		clone.position = Vector2(0,0)
		_center_container.add_child(clone)
		var child_count = clone.get_child_count()
		if child_count != 0:
			clone.get_child(0).show_description()

func hide_equipped(_item: item):
	if _slot_center_control:
		if _item == current_displayed_item:
			_slot_center_control.queue_free()
