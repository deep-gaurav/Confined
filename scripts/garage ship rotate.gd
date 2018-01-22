extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var stop=false
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
func _fixed_process(delta):
	if !stop:
		rotate_y(deg2rad(0.5))
	elif get_rotation_deg().y!=0:
		rotate_y(deg2rad(0.5))
	else:
		set_process(false)
