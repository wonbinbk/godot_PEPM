extends HingeJoint

var speed = 0.2

#func _ready():
#	set_param(HingeJoint.PARAM_MOTOR_MAX_IMPULSE, 100000000)
func _physics_process(delta):
	var x = int(Input.is_action_pressed("boom_up")) - int(Input.is_action_pressed("boom_down"))
	set_param(HingeJoint.PARAM_MOTOR_TARGET_VELOCITY, x * speed)
