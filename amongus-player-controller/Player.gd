extends KinematicBody2D


var velocity = Vector2(0,0)
const SPEED = 450


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$Sprite.flip_h = true
	else:
		velocity.x = 0
	
	velocity.y = velocity.y
	
	if Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
	else:
		velocity.y = 0
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
	
	
	
