extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pchase
var startpos
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	startpos=get_global_transform().origin
	pchase=global_game.player.get_node("Position3D")
func _fixed_process(delta):
	var tochase=pchase.get_global_transform().origin
	move_to(tochase)
