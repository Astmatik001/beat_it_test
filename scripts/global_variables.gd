extends Node

var rng = RandomNumberGenerator.new()

var playbacking: bool 
func _ready() -> void:
	playbacking = false
func toggle_playbacking():
	playbacking = not playbacking

var Placeholder: int = 0:
	get: return Placeholder
var Space: int = 0:
	get: return Space

var Kick: int = 1:
	get: return Kick
var Snare: int = 2:
	get: return Snare
var HiHat: int = 3:
	get: return HiHat

var Short: int = -1:
	get: return Short
var Long: int = -2:
	get: return Long
var Quiet: int = -3:
	get: return Quiet
var Loud: int = -4:
	get: return Loud
