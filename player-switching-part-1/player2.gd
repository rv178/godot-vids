extends KinematicBody

var speed = 20
var acceleration = 15
var air_acceleration = 5
var gravity = 0.98
var max_velocity = 54
var jump_force = 20

var mouse_sensitivity = 0.3
var min_p = -90
var max_p = 90

var velocity : Vector3
var y_velocity : float

onready var Pivot = $Spatial/SpringArm
onready var camera = $Spatial/SpringArm/Camera1

onready var active = false


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	if Input.is_action_just_pressed("ui_accept"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		Pivot.rotation_degrees.x -= event.relative.y * mouse_sensitivity
		Pivot.rotation_degrees.x = clamp(Pivot.rotation_degrees.x,min_p,max_p)
	
func _process(delta):
	handle_movement(delta)


func handle_movement(delta):
	
	var direction = Vector3()

	if active:
		
		if Input.is_action_pressed("move_forward"):
			direction -= transform.basis.z

		if Input.is_action_pressed("move_backward"):
			direction += transform.basis.z

		if Input.is_action_pressed("move_left"):
			direction -= transform.basis.x

		if Input.is_action_pressed("move_right"):
			direction += transform.basis.x
	
	direction = direction.normalized()
	
	var accel = acceleration if is_on_floor()else air_acceleration
	
	velocity = velocity.linear_interpolate(direction * speed,accel * delta)
	
	if is_on_floor():
		y_velocity = -0.01
	
	else:
	
		y_velocity = clamp(y_velocity - gravity, -max_velocity,max_velocity)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		y_velocity = jump_force
		
	velocity.y = y_velocity
	velocity = move_and_slide(velocity,Vector3.UP)
