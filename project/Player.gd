extends KinematicBody2D
export(float) var speed

func _ready():
	$AnimatedSprite.animation = "down"
	Globulars.player = self

var is_walking = false

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
	
	var newanimation
	if velocity.x > 0:
		newanimation = "right"
	elif velocity.x < 0:
		newanimation = "left"
	elif velocity.y < 0:
		newanimation = "up"
	elif velocity.y > 0 :
		newanimation = "down"
	else:
		newanimation = null
		
	if is_walking and newanimation == null:
		is_walking = false
		$AnimatedSprite.playing = false
		$AnimatedSprite.frame = 1
	elif newanimation != null and (not is_walking or newanimation != $AnimatedSprite.animation):
		is_walking = true
		$AnimatedSprite.animation = newanimation
		$AnimatedSprite.playing = true
		$AnimatedSprite.frame = 0
