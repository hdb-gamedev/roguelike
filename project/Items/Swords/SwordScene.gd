extends Node2D

var rotation_speed
var swing_time = 0.25
var swinging = false
var item

func start_swing():
	look_at(get_global_mouse_position())
	swing_time = 0.125
	rotation_degrees -= rotation_speed * swing_time * 0.5
	swinging = true
	visible = true

func _process(delta):
	if swinging:
		rotation_degrees += rotation_speed * delta
		swing_time -= delta
		
	if swing_time < 0:
		visible = false
		swinging = false
