extends KinematicBody2D
export(float) var speed

func _ready():
	$AnimatedSprite.animation = "down"

func _physics_process(delta):
	var velocity = Vector2(0,0)
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * speed)
	
	if velocity.x > 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.playing = true
	elif velocity.x < 0:
		$AnimatedSprite.animation = "left"
		$AnimatedSprite.playing = true
	elif velocity.y < 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.playing = true
	elif velocity.y > 0 :
		$AnimatedSprite.animation = "down"
		$AnimatedSprite.playing = true
	else:
		$AnimatedSprite.playing = false
		$AnimatedSprite.frame = 1
