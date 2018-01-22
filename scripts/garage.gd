extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var sp=null
var shipnode
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	set_process(true)
	shipnode=get_node("Control/Viewport/Spatial/ships")
func _process(delta):

	if shipnode.ships[shipnode.currentship]['price']!=0:
		get_node("Customise").set_disabled(true)
		get_node("Customise/buyship").set_disabled(false)
	else:
		get_node("Customise").set_disabled(false)
		get_node("Customise/buyship").set_disabled(true)
func _on_Customise_pressed():
	get_node("AnimationPlayer").play("customise")
	get_node("TextureButton1").set_hidden(true)
	get_node("TextureButton").set_hidden(true)
	get_node("Customise").set_hidden(true)
	get_node("Play").set_hidden(false)
	get_node("Header").set_text("Customise")


func _on_buyship_pressed():
	
	get_parent().get_node("Control2/Patch9Frame").showbox('Ship',shipnode.ships[shipnode.currentship]['price'],'vb',self,0)
	
func buying_done(n):
	shipnode.ships[shipnode.currentship]['price']=n
	shipnode.savedicts()
	global_game.saveval()
	global_game.savecoin()

func _on_color_toggled( pressed ):
	if pressed:
		get_node("Play/color/AnimationPlayer").play("open colour")
	else:
		get_node("Play/color/AnimationPlayer").play_backwards('open colour')
