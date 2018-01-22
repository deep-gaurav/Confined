extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_text(str(global_game.coins))
	set_process(true)
	
func _process(delta):
	if int(get_text())<global_game.coins:
		set_text(str(int(get_text())+2))


func _on_ccoin_visibility_changed():
	set_text(str(global_game.coins))