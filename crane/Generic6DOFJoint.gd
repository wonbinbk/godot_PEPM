extends Generic6DOFJoint

var speed = 0.2

func _physics_process(delta):
	var x = int(Input.is_action_pressed("boom_right")) - int(Input.is_action_pressed("boom_left"))
	set_param_z(Generic6DOFJoint.PARAM_ANGULAR_MOTOR_TARGET_VELOCITY, x * speed)
