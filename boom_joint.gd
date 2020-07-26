extends Spatial
onready var boom01 = get_node("boom01")
onready var boom02 = get_node("boom01/boom02")
onready var boom03 = get_node("boom01/boom02/boom03")

export var rotate_speed = PI/10
var rotate = 0
var boom_extend = 0
const BOOM_RES = 0.1
const MAX_BOOM = 40
var cur_boom02_extend = 0
var cur_boom03_extend = 0

func get_rotate():
	if Input.is_action_pressed("boom_down"):
		if Input.is_action_pressed("boom_up"):
			rotate = 0
		else:
			rotate = -1
	elif Input.is_action_pressed("boom_up"):
		rotate = 1
	else:
		rotate = 0

func get_extend():
	if Input.is_action_pressed("boom_extend"):
		if not Input.is_action_pressed("boom_retract"):
			boom_extend = 1
	elif Input.is_action_pressed("boom_retract"):
		boom_extend = -1
	else: boom_extend = 0

func _physics_process(delta):
	get_rotate()
	if rotate:
		transform.basis = transform.basis.rotated(Vector3(1,0,0), 
							rotate_speed * rotate * delta)
	get_extend()
	if (boom_extend > 0):
		if (cur_boom02_extend < MAX_BOOM*BOOM_RES):
			cur_boom02_extend += BOOM_RES
			boom02.transform = boom02.transform.translated(
			Vector3(0,0,BOOM_RES))
		elif (cur_boom03_extend < MAX_BOOM*BOOM_RES):
			cur_boom03_extend += BOOM_RES
			boom03.transform = boom03.transform.translated(
			Vector3(0,0,BOOM_RES))
	elif (boom_extend < 0):
		if (cur_boom03_extend > 0):
			cur_boom03_extend -= BOOM_RES
			boom03.transform = boom03.transform.translated(
			Vector3(0,0,-BOOM_RES))
		elif (cur_boom02_extend > 0):
			cur_boom02_extend -= BOOM_RES
			boom02.transform = boom02.transform.translated(
			Vector3(0,0,-BOOM_RES))
