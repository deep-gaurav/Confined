extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var boss
var chscore2=500
var chscore
var wall_type=1
var walls
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	walls=[load("res://scenes/cylinder_wall.tscn"),load("res://scenes/walls 2.tscn")]
	chscore2=500
	boss=load("res://scenes/boss.tscn")


func _on_score_timeout():
	global_game.score+=1 
	var score=global_game.score
	if score>=chscore:
		chscore+=500
		
		if wall_type==1:
			wall_type=2
		elif wall_type==2:
			wall_type=1
	# NEW WAVE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		global_game.wave+=1
		change_wall(wall_type)
		global_game.generator.set_fixed_process(false)
		get_node("wave_break").start()
		get_node("../../wave/wave").set_text("WAVE "+str(global_game.wave))
		get_node("../../wave/AnimationPlayer").play("flash")
		if global_game.wave%2==0:
			var bn=boss.instance()
			global_game.root.add_child(bn)
			bn.set_translation(Vector3(-5.2,0.8,0))
func change_wall(wall):
	
	if wall==2:
		
		
		var nwall=walls[0].instance()
		#var nwall=load("res://scenes/walls.tscn").instance()
		global_game.currentwall.get_node("AnimationPlayer").play("out")
		global_game.root.add_child(nwall)
		global_game.currentwall=nwall
		nwall.set_translation(Vector3(0,0,0))
		nwall.get_node("AnimationPlayer").play("in")
	elif wall==1:
		
		
		var nwall=walls[1].instance()
	
		
		global_game.currentwall.get_node("AnimationPlayer").play("out")
		global_game.root.add_child(nwall)
		global_game.currentwall=nwall
		nwall.set_translation(Vector3(0,0,0))
		nwall.get_node("AnimationPlayer").play("in")
	


func _on_wave_break_timeout():
	global_game.generator.set_fixed_process(true) # replace with function body
