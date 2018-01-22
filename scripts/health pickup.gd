extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed=0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	print('here')
	
func _fixed_process(delta):
	move(speed*Vector3(0.4,0,0))
	if is_colliding():
		if   get_collider().is_in_group('player'):
			global_game.hp=global_game.shipdicts['max_hp']
			queue_free()