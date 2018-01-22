extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_text("Score : "+str(global_game.score))


func _on_Score_visibility_changed():
	set_text("Score : "+str(global_game.score))
