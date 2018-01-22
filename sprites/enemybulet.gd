extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var timer=0
var life=1.5
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	timer+=delta
	if timer>life:
		queue_free()
	for x in get_colliding_bodies():
		if x.is_in_group("player"):
			queue_free()
			global_game.hp-=10
		if x.is_in_group('shield'):
			x.get_parent().get_node('AnimationPlayer2').play('shield show')