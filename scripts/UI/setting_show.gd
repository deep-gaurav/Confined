extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	if OS.get_name()=="HTML5":
		set_hidden(true)


func _on_Settings_pressed():
	set_hidden(true)
	get_parent().get_node("Play").set_hidden(true)
	get_parent().get_node("Credits").set_hidden(true)
	get_parent().get_parent().get_node("settings").set_hidden(false)
	get_parent().get_node("Garage").set_hidden(true)
func _on_Credits_pressed():
	set_hidden(true)
	get_parent().get_node("Play").set_hidden(true)
	get_parent().get_node("Settings").set_hidden(true)
	get_parent().get_parent().get_node("credits").set_hidden(false)
	get_parent().get_node("Garage").set_hidden(true)

func _on_Garage_pressed():
	get_tree().change_scene_to(load("res://scenes/garage.tscn"))



func _on_Garage_visibility_changed():
	if OS.get_name()=="HTML5":
		set_hidden(true)