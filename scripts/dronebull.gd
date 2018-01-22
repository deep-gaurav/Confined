extends MeshInstance

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pl
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	print(global_game.player1)
	pl=get_parent().get_parent().get_parent()
	pl.connect('firing',self,'firing')
func firing():
	var bullet=load("res://scenes/bullet.tscn")
	var nb1=bullet.instance()
	pl.get_parent().add_child(nb1)
	nb1.set_global_transform(get_global_transform())
