

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Area_body_enter( body ):
	if !body.is_in_group("wall"):
		
		if body.is_in_group("enemy"):
			body.outdy=true
		body.queue_free()


func _on_Area_area_enter( area ):
	if area.is_in_group("laser"):
		area.queue_free()
