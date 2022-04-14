extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _sort_children():
	#rect_min_size = Vector2(0, 5 * get_child(0).rect_size.y)
	print(Vector2(0, 5 * get_child(0).rect_size.y))
