
extends Node

var re=false

func _ready():
	global_game.menuactive=true
	if global_game.re and has_node("Patch9Frame/Button/menu"):
		queue_free()

func _on_AnimationPlayer_finished():
	if get_node("Patch9Frame/AnimationPlayer").get_current_animation()=="close":
		queue_free()
		global_game.root.get_node("wave/AnimationPlayer").play("flash")
		global_game.re=false
		get_parent().get_node("UI").set_hidden(false)
		get_parent().get_node("enemy generator").set_fixed_process(true)
		global_game.player.set_hidden(false)
		global_game.hp=global_game.shipdicts['max_hp']
		global_game.score=0
		global_game.bullets=100
		global_game.rockets=200
		global_game.wave=1
		get_parent().get_node("Node/score").chscore=get_parent().get_node("Node/score").chscore2
		get_parent().get_node("UI/health").set_process(true)
		get_parent().get_node("UI").makebutton()
		get_parent().get_node("Node/score").start()
		global_game.curshipmatnode.assignmat()
func _on_Button_button_down():
	get_node("Patch9Frame/AnimationPlayer").play("close") # replace with function body



func _on_menu_pressed():
	get_child(0).free()
	queue_free()
	var x=load("res://scenes/float_menu.tscn").instance()
	get_parent().add_child(x)
func _on_resume_pressed():
	get_parent().queue_free()


func _on_button_pressed():
	_on_Button_button_down()
	
func _exit_tree():
	global_game.menuactive=false

func _notification(what):
	if what==MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		get_tree().quit()