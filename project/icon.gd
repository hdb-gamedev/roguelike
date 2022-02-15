extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	# 1 full rotation per second
	rotate(2 * PI * delta)
