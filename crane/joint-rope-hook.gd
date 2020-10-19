extends SliderJoint

const STEP = 0.01
var l = -0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	set_param(SliderJoint.PARAM_LINEAR_LIMIT_LOWER, -5)

func _physics_process(delta):
	var x = int(Input.is_action_pressed("hook_down")) \
		- int(Input.is_action_pressed("hook_up"))
	
	set_param(SliderJoint.PARAM_LINEAR_LIMIT_LOWER, -5)
