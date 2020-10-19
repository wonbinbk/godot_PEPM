extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func push(p,f):
	var pos = transform.origin + Vector3(p,0,0)
	var force = transform.origin + Vector3(0,0,f)
	apply_impulse(pos, force)
	
func move_left(v):
	translate(Vector3(-v,0,0))
func move_right(v):
	translate(Vector3(v, 0, 0))
func follow_mouse():
	var target = get_node("../../body3").global_transform.origin
	look_at(Vector3(target.x, global_transform.origin.y, -target.z), Vector3.UP)
	rotate_object_local(Vector3(0,1,0), PI)

func _input(event):
	if(event is InputEventMouseButton):
		follow_mouse()

func _unhandled_key_input(event):
	if (Input.is_action_pressed("boom_up")):
		push(4,100)
	elif (Input.is_action_pressed("boom_down")):
		push(4,-100)
	elif Input.is_action_pressed("boom_left"):
		move_left(1)
	elif Input.is_action_pressed("boom_right"):
		move_right(1)
