extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal firing
var rocket
var shield=null
var bullspeed=10
var speed = 0.1
var bullet
var stimer=0
var stimerspeed=0.15
var mmotion=Vector3(0,0,0)
var vcur=null
var relcount=true
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	connect("exit_tree",self,"exit")
	#connect("firing",self,"firingtst")
	global_game.player=self
	global_game.player1=self
	set_fixed_process(true)
	bullet=load("res://scenes/bullet.tscn")
	rocket=load("res://scenes/rocket.tscn")
func _fixed_process(delta):
	global_game.player=self
	stimer+=delta
	move(mmotion)
	if Input.is_action_pressed("pl_up"):
		move(speed*Vector3(0,1,0))
	if Input.is_action_pressed("pl_down"):
		move(speed*Vector3(0,-1,0))
	if Input.is_action_pressed("pl_left"):
		move(speed*Vector3(0,0,1))
	if Input.is_action_pressed("pl_right"):
		move(speed*Vector3(0,0,-1))
	if Input.is_action_pressed("pl_fire") and stimer>stimerspeed and global_game.bullets>=2:
		get_node("SpatialSamplePlayer").play("fire")
		global_game.bullets-=2
		emit_signal("firing")
		var nb1=bullet.instance()
		get_parent().add_child(nb1)
		nb1.set_global_transform(get_node("firept1").get_global_transform())
		var nb2=bullet.instance()
		get_parent().add_child(nb2)
		nb2.set_global_transform(get_node("firept2").get_global_transform())
		if has_node("firept3"):
			var nb3=bullet.instance()
			get_parent().add_child(nb3)
			nb3.set_global_transform(get_node("firept3").get_global_transform())
		if has_node("firept4"):
			var nb4=bullet.instance()
			get_parent().add_child(nb4)
			nb4.set_global_transform(get_node("firept4").get_global_transform())
	if Input.is_action_pressed("roc_fire") and global_game.roc>0 and global_game.rockets==200:
		get_node("SpatialSamplePlayer").play('fuse')
		global_game.roc-=1
		var nroc=rocket.instance()
		global_game.rockets-=200
		get_parent().add_child(nroc)
		nroc.set_translation(get_translation())
		nroc.set_linear_velocity(12*Vector3(-1,0,0))
		
		
		

	rotate_x(deg2rad(get_rotation_deg().x-mmotion.z*500)/8)
	if Input.is_action_pressed("fast"):
		OS.set_time_scale(OS.get_time_scale()+0.1)
	if Input.is_action_pressed("slow"):
		OS.set_time_scale(OS.get_time_scale()-0.1)
	
	if is_colliding():
		if get_collider().is_in_group('enemy'):
			get_collider().queue_free()
	if stimer>stimerspeed:
		stimer=0
		
func exit():
	var c=self.duplicate()
	get_parent().add_child(c)
	
func firingtst():
	print('firing')