extends Control

var time = 0

func _process(delta):
	time += delta
	$bar.fill = sin(time) * 0.5 + 0.5
