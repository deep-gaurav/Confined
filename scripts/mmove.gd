extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)

func _input_event(event):
	if event.type==InputEvent.MOUSE_MOTION:
		global_game.player.mmotion=(0.01*Vector3(0,event.relative_y,event.relative_x))
	elif event.type==InputEvent.SCREEN_DRAG:
		global_game.player.mmotion=(0.01*Vector3(0,event.relative_y,event.relative_x))
	