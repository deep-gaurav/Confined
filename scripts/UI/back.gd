extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_back_pressed():
	get_parent().get_parent().get_node("container/Garage").set_hidden(false)
	get_parent().get_parent().get_node("container/Play").set_hidden(false)
	get_parent().get_parent().get_node("container/Settings").set_hidden(false)
	get_parent().get_parent().get_node("container/Credits").set_hidden(false)
	get_parent().set_hidden(true) # replace with function body
	global_game.saveval()


func _on_back1_pressed():
	get_parent().get_parent().get_node("container/Garage").set_hidden(false)
	get_parent().get_parent().get_node("container/Play").set_hidden(false)
	get_parent().get_parent().get_node("container/Settings").set_hidden(false)
	get_parent().get_parent().get_node("container/Credits").set_hidden(false)
	get_parent().set_hidden(true) # replace with function body
	global_game.saveval()# replace with function body
