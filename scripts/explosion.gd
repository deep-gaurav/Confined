extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tim=0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("SpatialSamplePlayer").play('blast')



func _on_Timer_timeout():
	queue_free() # replace with function body
