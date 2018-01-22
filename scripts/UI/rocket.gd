extends TextureProgress

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
func _process(delta):
	if get_value()<global_game.rockets:
		set_value(get_value()+4)
	elif get_value()>global_game.rockets:
		set_value(get_value()-25)
	get_node("no").set_text(str(global_game.roc))
