class_name sound_object
extends AudioStreamPlayer2D


var muted: bool
var loud: bool
var quiet: bool
var long: bool
var short: bool


func set_sound(sound: AudioStream) -> void:
	stream = sound
func change_volume(value: int) -> void:
	volume_db += value
func change_scale(value: int) -> void:
	pitch_scale *= value
	
func reset() -> void:
	loud = false
	quiet = false
	long = false
	short = false
	volume_db = 0
	pitch_scale = 1

func _ready() -> void:
	muted = false
func toggle_mute():
	muted = not muted

func play_my_sound():
	if not muted:
		play()
