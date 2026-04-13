class_name sound_object
extends AudioStreamPlayer2D


var muted: bool
var loud: bool
var quiet: bool
var long: bool
var short: bool

func reset() -> void:
	loud = false
	quiet = false
	long = false
	short = false
	volume_db = 0
	pitch_scale = 1

func toggle_mute():
	muted = not muted

func _ready() -> void:
	muted = false

func set_sound(sound: AudioStream) -> void:
	stream = sound
	
func play_my_sound():
	if loud:
		volume_db += 10
	if quiet:
		volume_db -= 10
	if long:
		pitch_scale /= 3
	if short:
		pitch_scale *= 3
	if not muted:
		play()
