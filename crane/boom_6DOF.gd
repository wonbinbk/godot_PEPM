extends Generic6DOFJoint

export var LINEAR_SPEED = 2 #	acts like a constant
export var LOWER_LIMIT = -6
export var UPPER_LIMIT = 0

func _ready():
	set_param_x(Generic6DOFJoint.PARAM_LINEAR_LOWER_LIMIT, LOWER_LIMIT)
	set_param_x(Generic6DOFJoint.PARAM_LINEAR_UPPER_LIMIT, UPPER_LIMIT)
	set_flag_x(Generic6DOFJoint.FLAG_ENABLE_LINEAR_MOTOR, true)
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var x = int(Input.is_action_pressed("boom_retract")) \
		- int(Input.is_action_pressed("boom_extend"))
	set_param_x(Generic6DOFJoint.PARAM_LINEAR_MOTOR_TARGET_VELOCITY, x * LINEAR_SPEED)
