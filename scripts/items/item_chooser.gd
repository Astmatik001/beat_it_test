class_name item_chooser
extends Area2D


var kick = preload("res://scenes/items/kick_item.tscn")
var snare = preload("res://scenes/items/snare_item.tscn")
var hi_hat = preload("res://scenes/items/hi_hat_item.tscn")
var double = preload("res://scenes/items/double_item.tscn")
var odd = preload("res://scenes/items/odd_item.tscn")

var item_array = [kick, snare, hi_hat, double, odd]

func _ready() -> void:
	generate_items()

func generate_items() -> void:
	for i in range(3):
		var _item: item
		_item = item_array.pick_random().instantiate()
		add_child(_item)
		_item.collision_layer = 5
		_item.position += Vector2(-40 * ( i - 1), 0)
		_item.ive_been_clicked.connect(_on_item_clicked)

signal item_chosen(item)

func _on_item_clicked(_item):
	_item.position = Vector2(0, 0)
	_item.ive_been_clicked.disconnect(_on_item_clicked)
	remove_child(_item)
	item_chosen.emit(_item)
	queue_free()
