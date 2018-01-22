extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	if global_game.shipdicts['drones']==0:
		queue_free()
	elif global_game.shipdicts['drones']==1:
		get_node("drone3").queue_free()
		get_node("drone2").queue_free()
	elif global_game.shipdicts['drones']==2:
		get_node("drone3").queue_free()
