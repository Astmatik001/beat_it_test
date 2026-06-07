class_name item_chooser
extends Control

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
		part.add_child(_item)

signal item_chosen(item)

func _on_item_clicked(_item):
	_item.position = Vector2(0, 0)
	_item.ive_been_clicked.disconnect(_on_item_clicked)
	_item.get_parent().remove_child(_item)
	item_chosen.emit(_item)
	queue_free()
