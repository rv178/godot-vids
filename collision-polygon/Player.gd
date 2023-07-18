extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 350

func _physics_process(delta):
	
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.flip_h = true
	else:
		velocity.x = 0

	velocity.y = velocity.y
	
	if Input.is_action_pressed("jump"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("duck"):
		velocity.y = SPEED
	else:
		velocity.y = 0

	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Area2D_body_entered(body):
	pass
