extends ProgressBar

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("HScrollBar").set_value(global_game.global_music)
	set_value(get_node("HScrollBar").get_value())
	AudioServer.set_stream_global_volume_scale(global_game.global_music/100)

func _on_HScrollBar_value_changed( value ):
	set_value(value) 
	global_game.global_music=value
	AudioServer.set_stream_global_volume_scale(value/100)
