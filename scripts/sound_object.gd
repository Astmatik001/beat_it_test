class_name sound_object
extends AudioStreamPlayer2D


var muted: bool


func set_sound(sound: AudioStream) -> void:
	stream = sound
func change_volume(value: int) -> void:
	volume_db += value
func change_scale(value: float) -> void:
	pitch_scale *= value
	
func reset() -> void:
	volume_db = 0
	pitch_scale = 1

func _ready() -> void:
	muted = false
func toggle_mute():
	muted = not muted

func play_my_sound():
	if not muted:
		play()
