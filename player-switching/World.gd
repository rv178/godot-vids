extends Spatial

onready var camera1 = $player1/Spatial/SpringArm/Camera1
onready var camera2 = $player2/Spatial/SpringArm/Camera2


func _ready():
	pass

func _input(event):
	if event.is_action_pressed("player_switch"):
		var temp_state = $player2.active
		$player2.active = $player1.active
		$player1.active = temp_state
		if event.is_action_pressed("player_switch"):
			if camera1.is_current():
				camera1.clear_current(true)
			elif camera2.is_current():
				camera2.clear_current(true)
