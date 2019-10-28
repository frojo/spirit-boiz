extends Node2D

var active := false

signal text_submitted(text)

func _ready():
	pass # Replace with function body.

func activate():
	set_visible(true)
	$text_edit.grab_focus()
	active = true

func _process(delta):
	if not active:
		return
	if Input.is_action_pressed('ui_test'):
		print('test!')
		emit_signal('text_submitted', $text_edit.get_text())
