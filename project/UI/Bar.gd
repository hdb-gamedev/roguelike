extends AspectRatioContainer
export(int) var max_health
export(Texture) var fill_texture
export(Texture) var end_texture

var fill = 0.5

var border_width
var border_height

var inside_width = 64
var inside_height = 4

var hpixel
var vpixel

func _ready():
	border_width = $Control/Border.texture.get_width()
	border_height = $Control/Border.texture.get_height()
	
	hpixel = 1.0 / border_width
	vpixel = 1.0 / border_height
	
	ratio = float(border_width) / float(border_height)
	
	$Control/Inside.anchor_left = (border_width - inside_width)/2.0 * hpixel
#	$Control/Inside.anchor_left = 2.0/68.0
	$Control/Inside.anchor_right = 1 - $Control/Inside.anchor_left
	$Control/Inside.anchor_top = (border_height - inside_height)/2.0 * vpixel
	$Control/Inside.anchor_bottom = 1 - $Control/Inside.anchor_top
#	var fill_rect1: TextureRect = TextureRect.instance()
#	$Inside.add_child(fill_rect1)
#	fill_rect1.anchor_left = 1 * pixel
#	fill_rect1.anchor_top = 1 * pixel
#	fill_rect1.anchor_bottom = 5 * pixel
#	fill_rect1.anchor_bottom = 17 * pixel
