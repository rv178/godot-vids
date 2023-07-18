extends Spatial

onready var camera1 = $player1/Spatial/SpringArm/Camera
onready var camera2 = $player2/Spatial/SpringArm/Camera1

func _ready():
	pass
	
func _input(event):
	if Input.is_action_pressed("player_switch"):
		var temp_state = $player2.active
		$player2.active = $player1.active
		$player1.active = temp_state
