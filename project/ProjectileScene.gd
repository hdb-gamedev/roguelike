extends KinematicBody2D

var speed = 6.03
var item

# Called when the node enters the scene tree for the first time.
func _process(delta):
	var collision := move_and_collide(Vector2(1, 0).rotated(transform.get_rotation()) * speed)
	if collision != null && collision.collider != null:
		if collision.collider.collision_layer | 1 == 1:
			print("hit wall")
			queue_free()
