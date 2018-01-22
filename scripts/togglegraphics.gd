extends CheckButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_CheckButton_toggled( pressed ):
	global_game.high_graphics=pressed
	save_graphics()

func save_graphics():
	var f=File.new()
	f.open("user://gtype.s",File.WRITE)
	if global_game.high_graphics:
		f.store_real(1)
	else:
		f.store_real(0)
	f.close()

func _on_CheckButton_visibility_changed():
	set_pressed(global_game.high_graphics)


func _on_toggle_graphics_visibility_changed():
	_on_CheckButton_visibility_changed()

func _on_toggle_graphics_toggled( pressed ):
	_on_CheckButton_toggled(pressed)
