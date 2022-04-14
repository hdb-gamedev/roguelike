extends Node2D
class_name PolearmScene
# Called when the node enters the scene tree for the first time.
export(float) var mind
export(float) var maxd
var time = 0
var item


func _ready():
	look_at(get_global_mouse_position())
	print("item", item)
	#$AnimationPlayer.play("Polearm")

func _process(delta):
	look_at(get_global_mouse_position())
	if !$AnimationPlayer.is_playing():
		visible = false
