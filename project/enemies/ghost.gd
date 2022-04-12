extends KinematicBody2D
#export var player_position = Vector2(-1,-1)

export var speed = 50
var velocity = Vector2(0,0)

func _on_AttackTimer_timeout():
	var playerPosition = Globulars.player.global_transform.origin
	var position = get_global_transform().origin
	velocity = (playerPosition - position).normalized() * speed
	$AttackTimer.wait_time = rand_range(0.1, 2)
	
func _physics_process(delta):
	move_and_slide(velocity)
