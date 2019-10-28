extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var text_submitted := false



# Called when the node enters the scene tree for the first time.
func _ready():
	$player.npc_area = $npc/interactable_area
	$player.connect('npc_talked', self, '_on_player_npc_talked')
	$message_enter.connect('text_submitted', self, '_on_text_submitted')

func _on_player_npc_talked():
	print('received signal')
	$player.active = false
	$message_enter.activate()

func _on_text_submitted(text):
	if not text_submitted:
		text_submitted = true
		print(text)
		var file = File.new()
		file.open('user://message.txt', File.WRITE)
		file.store_string(text)
		file.close()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
