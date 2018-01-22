extends Particles

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	set_emitting(false)

func _fixed_process(delta):
	if global_game.hp<=30:
		var hpn= 30-global_game.hp
		set_amount(abs(300*(hpn/30))+1)
		set_emitting(true)
	else:
		set_emitting(false)