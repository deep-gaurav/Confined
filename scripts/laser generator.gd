extends Position3D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var lasersce
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	lasersce=load("res://scenes/laser.tscn")


func _on_Timer_timeout():
	if get_parent().get_node("UI").is_visible():
		for x in range(3):
			randomize()
			var test=randf()
			if test>=0.5:
				lasergen()
func lasergen():
	var laser=lasersce.instance()
	add_child(laser)
	laser.set_translation(Vector3(0,0,0))
	randomize()
	var r=randf()
	laser.set_rotation_deg(Vector3(r*180,0,0))
