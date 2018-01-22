extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pt1
var pt2
var pt3
var pt4
var curenemy
var enemy
var etdiv=1
var etin=0.5
var et=0.5
var timer=0
var ngen=8
var cgen=0
var pt
var xsin
var wait=false;var waittimer=3;var waitcurt=0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization her
	pt1=get_node("pt1").get_translation()
	pt2=get_node("pt2").get_translation()
	pt3=get_node("pt3").get_translation()
	pt4=get_node("pt4").get_translation()
	global_game.generator=self
	enemy=[load("res://scenes/enemy2.tscn"),load("res://scenes/enemy1.tscn")]
func _fixed_process(delta):
	ngen=4+global_game.wave
	timer+=delta
	if cgen==0:
		randomize()
		pt=point_gen()
		cgen=1
		xsin=rand_range(-1,1)
		
		randomize()
		curenemy=enemy[randi()%(enemy.size())]
		randomize()
	if timer>=et and !wait:
		cgen+=1
		if cgen==ngen:
			cgen=0
			wait=true
		var nenemy=curenemy.instance()
		add_child(nenemy)
		nenemy.set_translation(pt)
		nenemy.xsin=pt.x
		nenemy.ysin=-pt.y
		timer=0
		
	elif wait:
		waitcurt+=delta
		if waitcurt>=waittimer:
			waitcurt=0
			wait=false

func point_gen():
	var posx=rand_range(pt1.x,pt2.x)
	var posy=rand_range(pt3.y,pt1.y)
	randomize()
	return Vector3(posx,posy,0)
	
