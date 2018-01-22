extends TextureProgress

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
func _process(delta):
	set_max(global_game.shipdicts['max_hp'])
	var hp=global_game.hp
	set_value(hp)
	
	if hp<=0:
		global_game.player.set_hidden(true)
		global_game.over=true
		get_parent().get_parent().get_node("enemy generator").set_fixed_process(false)
		get_parent().get_parent().get_node("UI").set_hidden(true)
		set_process(false)
		var overmenu=load("res://scenes/float_menu_over.tscn").instance()
		get_parent().get_parent().add_child(overmenu)
		get_parent().delbutton()
		get_parent().get_parent().get_node("Node/score").stop()
		print('root', global_game.root)
		admob.show_interstitial()
		global_game.savecoin()

		
	global_game.hp=hp
