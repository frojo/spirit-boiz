extends KinematicBody2D

export var move_speed := 1.0
var npc_area: Area2D = null
var active := true

var t := 0.0;

signal npc_talked

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	# apply movement
	if not active:
		return

	var velocity := Vector2(0, 0)

	print(sin(0))
	
	if Input.is_action_pressed('ui_right'):
		velocity.x = 1
	if Input.is_action_pressed('ui_left'):
		velocity.x = -1
	if Input.is_action_pressed('ui_up'):
		velocity.y = -1
	if Input.is_action_pressed('ui_down'):
		velocity.y = 1

	set_global_position(get_global_position() + velocity*move_speed)

	if Input.is_action_pressed('ui_select'):
		if $interact_area.overlaps_area(npc_area):
			emit_signal('npc_talked')
		
