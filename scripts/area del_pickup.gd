extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Area_body_enter( body ):
	if body.is_in_group("pickup"):
		body.queue_free()
