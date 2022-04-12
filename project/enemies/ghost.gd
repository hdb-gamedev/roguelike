extends RigidBody2D
#export var player_position = Vector2(-1,-1)

export var speed = 10

func _on_AttackTimer_timeout():
	var playerPosition = Globulars.player.global_transform.origin
	var position = get_global_transform().origin
	apply_central_impulse((playerPosition - position).normalized() * speed)
	#print(playerPosition)
	
