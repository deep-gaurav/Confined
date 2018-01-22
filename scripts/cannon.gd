extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	for x in get_colliding_bodies():
		if x.is_in_group('player'):
			queue_free()
			global_game.hp-=40
