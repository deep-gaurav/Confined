extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	
func _fixed_process(delta):
	if is_colliding():
		print('playing')
		get_parent().get_node("AnimationPlayer").play("shield show")
		if get_collider().is_in_group('enemy'):
			get_collider().queue_free()


func _on_KinematicBody_exit_tree():
	var x=self.duplicate()
	get_parent().add_child(x)
