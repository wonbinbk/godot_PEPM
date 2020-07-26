extends RigidBody
export var rotate_speed = PI/5
var rotate = 0
var rotate_angle = 0
func get_rotate():
	if Input.is_action_pressed("boom_left"):
		if Input.is_action_pressed("boom_right"):
			rotate = 0
		else:
			rotate = -1
	elif Input.is_action_pressed("boom_right"):
		rotate = 1
	else:
		rotate = 0

func _physics_process(delta):
	get_rotate()
	transform.basis = transform.basis.rotated(Vector3.UP, rotate_speed * rotate * delta)
		
