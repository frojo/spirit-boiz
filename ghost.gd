extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	var velocity := Vector2(0, 0)
	
	if Input.is_action_pressed('ui_right'):
		velocity.x
