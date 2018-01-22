extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var paused=false
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_parent().set_hidden(true)
	
func _notification(what):
	print('notification ', what, ' ',MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
	if !paused and what==MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		pause()
	elif paused and what==MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		resume()
func resume():
	get_parent().set_hidden(true)
	paused=false
	get_tree().set_pause(false)
	global_game.UI.set_hidden(false)
func pause():
	if !global_game.menuactive:
		global_game.UI.set_hidden(true)
		print('pausing')
		get_parent().set_hidden(false)
		get_tree().set_pause(true)
		paused=true