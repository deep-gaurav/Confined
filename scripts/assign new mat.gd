extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _ready():
	assignmat()
	global_game.curshipmatnode=self

func assignmat():
	# Called every time the node is added to the scene.
	# Initialization here
	if global_game.materials!=null:
		get_node("mesh").get_mesh().surface_get_material(1).set_parameter(FixedMaterial.PARAM_DIFFUSE,global_game.materials[0])
		get_node("mesh").get_mesh().surface_get_material(2).set_parameter(FixedMaterial.PARAM_DIFFUSE,global_game.materials[1])

