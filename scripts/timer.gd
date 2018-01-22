extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Timer_timeout():
	if !Input.is_action_pressed("pl_fire") and global_game.bullets<global_game.maxbullets:
		global_game.bullets+=2
	if !Input.is_action_pressed("roc_fire") and global_game.rockets<200:
		global_game.rockets+=20