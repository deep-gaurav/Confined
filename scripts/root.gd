extends Node

var ship_parent
var curship
var curshipnum
var spotlight
var tim=0
var firebase
func _ready():
	global_game.re=true
	# Called every time the node is added to the scene.
	# Initialization here
	add_child(load("res://scenes/float_menu.tscn").instance())
	curshipnum=global_game.curshipnum
	ship_parent=get_node("Spatial/Spatial")
	curship=load("res://scenes/fighter"+str(curshipnum)+".tscn").instance()
	ship_parent.add_child(curship)
	curship.set_translation(Vector3(0,-2,0))
	var tmp_light=ship_parent.get_node("OmniLight")
	ship_parent.remove_child(tmp_light)
	
	var tmp_pos3d=ship_parent.get_node("Position3D")
	ship_parent.remove_child(tmp_pos3d)
	ship_parent.get_node("animated_camera").to_pos_node=curship
	ship_parent.get_node("animated_camera").set_process(true)
	curship.add_child(tmp_pos3d)
	curship.add_child(tmp_light)
	global_game.root=self
	global_game.currentwall=get_node("Spatial/walls 2")
	global_game.eap=get_node("WorldEnvironment/AnimationPlayer")
	spotlight=get_node("Spatial/Spatial/OmniLight")
	if OS.get_name()=='Android' and false:
		firebase_init()
		print('Initialising Firbase')
		firebase.show_banner_ad(true)
	IAP.set_auto_consume(true)
	get_tree().set_auto_accept_quit(false)
func firebase_init():
	firebase = Globals.get_singleton("FireBase")
	
	if OS.get_name()=='Android':
		firebase.init("", get_instance_ID())
func _receive_message(from, key, data):
	if from == "FireBase":
		print("Key: " + key, " Data: ", data)
		
func _on_UI_visibility_changed():
	if get_node("UI").is_visible():
		admob.hide_banner()
	else:
		admob.show_banner()
