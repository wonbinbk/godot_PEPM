extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var move = false

func _integrate_forces(state):
	if Input.is_action_just_pressed("roll_left"):
		add_central_force(Vector3(100,0,0))
	elif Input.is_action_just_pressed("roll_right"):
		add_central_force(Vector3(-100,0,0))
