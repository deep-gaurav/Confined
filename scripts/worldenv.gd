extends WorldEnvironment

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
func _process(delta):
	if global_game.high_graphics:
		set_environment(load('res://resources/high.tres'))
	else:
		set_environment(load('res://resources/low.tres'))