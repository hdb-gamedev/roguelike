tool

extends AspectRatioContainer
export(int) var max_health
export(Texture) var fill_texture
export(Texture) var end_texture

export(float, 0.0, 1.0) var fill = 0.5 setget set_fill

var border_width
var border_height

onready var fill_rect = $Control/Inside/fill

var inside_width = 64
var inside_height = 4

var num_bars = 4

var hpixel
var vpixel

func _ready():
	border_width = $Control/Border.texture.get_width()
	border_height = $Control/Border.texture.get_height()
	
	hpixel = 1.0 / border_width
	vpixel = 1.0 / border_height
	
	ratio = float(border_width) / float(border_height)
	
	
	$Control/Inside.anchor_left = 2.0 / border_width
	$Control/Inside.anchor_right = 1 - 2.0 / border_width
	$Control/Inside.anchor_top = 5.0 / border_height
	$Control/Inside.anchor_bottom = 1 - 5.0 / border_height
	
func set_fill(x):
	fill = x
	var full_bars = floor(x/num_bars)
	
	if fill_rect:
		fill_rect.material.set_shader_param("fill", lerp(-2.0/64.0, 1.0, fill))
