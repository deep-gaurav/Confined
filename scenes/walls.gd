extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_AnimationPlayer_finished():
	if get_node("AnimationPlayer").get_current_animation()=="out":
		queue_free()