extends AudioStreamPlayer

export(AudioStreamSample) var ambiance
export(int) var loop_begin
export(int) var loop_end

func _ready():
	stream = ambiance
	stream.loop_begin = loop_begin
	stream.loop_end = loop_end
	stream.loop_mode = stream.LOOP_FORWARD
	
	print(stream.loop_mode, " ", stream.loop_begin, " ", stream.loop_end)
