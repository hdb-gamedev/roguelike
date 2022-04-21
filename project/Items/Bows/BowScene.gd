extends Node2D


func _process(delta):
	look_at(get_global_mouse_position())


func _on_AudioStreamPlayer_finished():
	get_node("AudioStreamPlayer").stop() # Replace with function body.
	print("stopping")
