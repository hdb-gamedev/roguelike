extends RigidBody2D
export var player_position = Vector2(0,0)


func _on_AttackTimer_timeout():
	apply_central_impulse(player_position)
