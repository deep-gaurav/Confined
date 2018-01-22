
extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_AnimationPlayer_finished():
	if get_node("Patch9Frame/AnimationPlayer").get_current_animation()=="close":
		get_node("Patch9Frame").set_hidden(true)
		get_node("Patch9Frame/resume").resume()
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
	_on_AnimationPlayer_finished() # replace with function body



func _on_menu_pressed():
	get_node("Patch9Frame/resume").resume()
	get_tree().reload_current_scene()

func _on_resume_pressed():
	get_node("Patch9Frame/resume").resume()


func _on_button_pressed():
	_on_Button_button_down()
