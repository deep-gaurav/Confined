extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var key
func _ready():
	global_game.UI=self
	makebutton()
	
func delbutton():
		pass

func makebutton():
	# Called every time the node is added to the scene.
	# Initialization here
	var keys=load("res://scenes/Joystick.tscn").instance()
	add_child(keys)
	key=keys