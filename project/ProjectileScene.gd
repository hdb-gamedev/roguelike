extends KinematicBody2D


var speed = 6.03

# Called when the node enters the scene tree for the first time.
func _process(delta):
	move_and_collide(Vector2(1, 0).rotated(transform.get_rotation()) * speed)
	
