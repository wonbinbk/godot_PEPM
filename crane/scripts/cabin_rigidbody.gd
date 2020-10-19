extends RigidBody
onready var boom_joint = get_node("boom_joint")
onready var boom01 = get_node("boom_joint/boom01")
onready var boom02 = get_node("boom_joint/boom01/boom02")
onready var boom03 = get_node("boom_joint/boom01/boom02/boom03")

export var rotate_speed = PI/10
var boom_rotate = 0
var cabin_rotate = 0
var boom_extend = 0
const BOOM_RES = 0.1
const MAX_BOOM = 60
var cur_boom02_extend = 0
var cur_boom03_extend = 0

func rotate_new():
	
	pass

func get_rotate():
	boom_rotate = 0
	cabin_rotate = 0
	if Input.is_action_pressed("boom_down"):
		if Input.is_action_pressed("boom_up"):
			boom_rotate = 0
		else:
			boom_rotate = 1
	elif Input.is_action_pressed("boom_up"):
		boom_rotate = -1
	elif Input.is_action_pressed("boom_left"):
		if Input.is_action_pressed("boom_right"):
			cabin_rotate = 0
		else: cabin_rotate = 1
	elif Input.is_action_pressed("boom_right"):
		cabin_rotate = -1

func get_extend():
	if Input.is_action_pressed("boom_extend"):
		if not Input.is_action_pressed("boom_retract"):
			boom_extend = 1
	elif Input.is_action_pressed("boom_retract"):
		boom_extend = -1
	else: boom_extend = 0

func _physics_process(delta):
	get_rotate()
	if boom_rotate:
		boom_joint.transform.basis = boom_joint.transform.basis.rotated(Vector3(0,0,1), 
							rotate_speed * boom_rotate * delta)
	if cabin_rotate:
		transform.basis = transform.basis.rotated(Vector3(0,1,0), rotate_speed * cabin_rotate * delta)
	get_extend()
	if (boom_extend > 0):
		if (cur_boom02_extend < MAX_BOOM*BOOM_RES):
			cur_boom02_extend += BOOM_RES
			boom02.transform = boom02.transform.translated(
			Vector3(-BOOM_RES,0,0))
		elif (cur_boom03_extend < MAX_BOOM*BOOM_RES):
			cur_boom03_extend += BOOM_RES
			boom03.transform = boom03.transform.translated(
			Vector3(-BOOM_RES,0,0))
	elif (boom_extend < 0):
		if (cur_boom03_extend > 0):
			cur_boom03_extend -= BOOM_RES
			boom03.transform = boom03.transform.translated(
			Vector3(BOOM_RES,0,0))
		elif (cur_boom02_extend > 0):
			cur_boom02_extend -= BOOM_RES
			boom02.transform = boom02.transform.translated(
			Vector3(BOOM_RES,0,0))

func _ready():
	set_as_toplevel(1)
	#angular_damp = 10
