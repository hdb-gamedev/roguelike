extends AudioStreamPlayer

export(AudioStream) var ambiance

func _ready():
	stream = ambiance
	playing = true
