extends KinematicBody2D

export var move_speed := 1.0
var npc_area: Area2D = null
var active := true
var velocity := Vector2(0, 0)
var drag = 0.01

var t := 0.0;

signal npc_talked

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	# apply movement
	if not active:
		return

	# var velocity := Vector2(0, 0)

	# make the ghost be anshus
	# var float_offset := get_global_position()
	# float_offset.x += 2*sin(t)
	# $spr.set_global_position(float_offset)

	# make the ghost do a little floaty thing
	var float_offset := get_global_position()
	float_offset.y += 8*sin(t/60)
	$spr.set_global_position(float_offset)

	
	if Input.is_action_pressed('ui_right'):
		velocity.x = 1
	if Input.is_action_pressed('ui_left'):
		velocity.x = -1
	if Input.is_action_pressed('ui_up'):
		velocity.y = -1
	if Input.is_action_pressed('ui_down'):
		velocity.y = 1


	if Input.is_action_pressed('ui_select'):
		if $interact_area.overlaps_area(npc_area):
			emit_signal('npc_talked')
		
	t += 1

func _physics_process(delta):
	velocity.x -= velocity.x * drag 
	velocity.y -= velocity.y * drag
	print(velocity.x)

	# if velocity.length() < .01:
	# 	velocity = Vector2.ZERO

	move_and_collide(velocity*move_speed)






