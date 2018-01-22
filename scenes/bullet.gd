extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	set_linear_velocity(Vector3(-7,0,0))
	
func _fixed_process(delta):
	for x in get_colliding_bodies():
		if x.is_in_group("enemy"):
			queue_free()
			x.hp-=10

func _exit_tree():
	var spark=global_game.spark.instance()
	get_parent().add_child(spark)
	spark.set_translation(get_translation())
	spark.set_emitting(true)