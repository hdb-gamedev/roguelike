extends KinematicBody2D
export(float) var speed
func _physics_process(delta):
	var velocity = Vector2(0,0)
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		$AnimatedSprite.animation = "up"
		
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		$AnimatedSprite.animation = "down"
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$AnimatedSprite.animation = "right"
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$AnimatedSprite.animation = "left"
	
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * speed)
	
	if velocity == Vector2(0,0):
		$AnimatedSprite.playing = false
		$AnimatedSprite.frame = 0
	else:
		$AnimatedSprite.playing = true
		
 
