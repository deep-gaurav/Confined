extends CheckButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_CheckButton_toggled( pressed ):
	global_game.joy=pressed # replace with function body


func _on_Button_released():
	 # replace with function body
	get_tree().change_scene("res://scenes/main.tscn")

func _on_Button_button_down():
	get_tree().change_scene("res://scenes/main.tscn")
