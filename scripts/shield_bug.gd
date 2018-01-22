extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _exit_tree():
	if global_game.shield>0:
		print('SHIELD BUG')
		var a=self.duplicate()
		get_parent().add_child(a)