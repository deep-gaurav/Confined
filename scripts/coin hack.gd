extends LineEdit

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	

func _process(delta):
	global_game.coins=int(get_text())

func _on_LineEdit_text_entered( text ):
	global_game.coins=int(text)


func _on_LineEdit_text_changed( text ):
	global_game.coins=int(text)