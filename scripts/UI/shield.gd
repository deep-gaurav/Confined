extends TextureProgress

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
func _process(delta):
	set_value(global_game.shield)
	var sh=global_game.shield
	if global_game.shield<=0 and global_game.player.shield!=null:
		global_game.player.shield.queue_free()
		global_game.player.shield=null
func _on_Timer_timeout():
	if global_game.shield>0:
		global_game.shield-=0.1*(4-global_game.shipdicts['shield_tim'])
