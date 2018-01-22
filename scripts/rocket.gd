extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var prox
var enemyps
var epcheck
var dir
var rocket_speed=7
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	prox=get_node("Area")
	dir=get_node("Position3D")
func _enter_tree():
	get_node("SpatialSamplePlayer").play('rocf')

func _fixed_process(delta):
	if epcheck.get_ref():
		look_at(enemyps.get_global_transform().origin,Vector3(0,1,0))
		var ndir=enemyps.get_global_transform().origin-get_global_transform().origin
		set_linear_velocity(rocket_speed*ndir.normalized())
	for x in get_colliding_bodies():
		if x.is_in_group("enemy"):
			queue_free()
			x.hp-=60
func _on_Area_body_enter( body ):
	if body.is_in_group("enemy"):
		prox.queue_free()
		enemyps=body
		epcheck=weakref(enemyps)
		set_fixed_process(true) # replace with function body

func _exit_tree():
	var x=get_node("SpatialSamplePlayer")
	remove_child(x)
	get_parent().add_child(x)
	x.play('explo')