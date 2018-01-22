extends ColorPickerButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var shipn
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	get_child(0).get_child(0).get_child(4).get_child(4).get_child(2).set_editable(false)
	get_child(0).get_child(0).get_child(4).get_child(4).get_child(2).set_focus_mode(Control.FOCUS_NONE)
func _on_ColorPickerButton_color_changed( color ):
	shipn=get_parent().get_parent().get_parent().shipnode
	shipn.changecolor(color)


func _on_ColorPickerButton_pressed():
	get_child(0).set_scale(Vector2(2,1))
	
func _on_ColorPickerButton2_pressed():
	_on_ColorPickerButton_pressed() # replace with function body
