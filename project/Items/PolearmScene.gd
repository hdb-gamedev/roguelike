extends Node2D

# Called when the node enters the scene tree for the first time.
export(float) var mind
export(float) var maxd
var time = 0
func _process(delta):
	time += delta
	look_at(get_local_mouse_position())
	var dist = cos(time) * (maxd - mind) + mind
	move_local_x(dist)
	if time > TAU / 2.0:
		queue_free()
