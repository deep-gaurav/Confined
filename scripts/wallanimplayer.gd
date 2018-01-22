extends AnimationPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var back=false
var anims
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	anims=['0','1','2','3','4']


func _on_AnimationPlayer_finished():
	if !back:
		play_backwards(get_current_animation())
		back=true
	else:
		randomize()
		var x = randi()%(anims.size()-1)
		play(str(x))
		back=false