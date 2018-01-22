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
			queue_free()
			global_game.shield=100
			if global_game.player.shield==null:
				var x=global_game.shield_m.instance()
				global_game.player.shield=x
				global_game.player.add_child(x)