extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var sensitivity=0.2
var inindex
var jt
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	jt=get_parent().get_node("joy base1/joy top")
	sensitivity=global_game.joysticksensitivity
func _fixed_process(delta):
	if get_texture().get_width()/2>=get_local_mouse_pos().length():
		jt.set_pos(get_local_mouse_pos())
	else:
		jt.set_pos(Vector2(0,0))
		
	
	global_game.player.mmotion=sensitivity*Vector3(0,-jt.get_pos().y/get_texture().get_width(),-jt.get_pos().x/get_texture().get_width())
	if jt.get_pos().x!=0:
		global_game.angle=tan(jt.get_pos().y/jt.get_pos().x)
		
