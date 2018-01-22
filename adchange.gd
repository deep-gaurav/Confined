extends Patch9Frame

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Patch9Frame_visibility_changed():
	if is_visible():
		admob.show_banner()
	else:
		admob.hide_banner()


func _on_Patch9Frame_exit_tree():
	admob.hide_banner()


func _on_Patch9Frame_enter_tree():
	if is_visible():
		admob.show_banner()
