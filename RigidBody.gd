extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _integrate_forces(state):
	add_central_force(Vector3(0,100,0))
