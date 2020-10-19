extends VehicleBody

const STEER_SPEED = 1
const STEER_LIMIT = 0.4
const BRAKE_FORCE = 100

var steer_target = 0
export var engine_force_value = 5000
# warning-ignore:unused_argument

func _physics_process(delta):
	var fwd_mps = transform.basis.xform_inv(linear_velocity).x
	steer_target = Input.get_action_strength("turn_left") - Input.get_action_strength("turn_right")
	steer_target *= STEER_LIMIT
	
	if Input.is_action_pressed("accelerate"):
		engine_force = engine_force_value
	else:
		engine_force = 0
		#brake = 1
	
	if Input.is_action_pressed("reverse"):
		if(fwd_mps >= -1):
			engine_force = -engine_force_value
		else:
			brake = BRAKE_FORCE
#		engine_force = -engine_force_value
	else:
		brake = BRAKE_FORCE
	
	steering = move_toward(steering, steer_target, STEER_SPEED * delta)
	
	
