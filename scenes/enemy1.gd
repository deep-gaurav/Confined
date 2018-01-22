extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var ysin
var antim=0
var outdy=false
var speed=0.1
var hp=5
var explo
var timers=0
var fpt
var bt
var bul_freq=3
var rewardcoin=50
var xsin
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	bt=global_game.bt
	fpt=get_node("firept")
	set_fixed_process(true)
	explo=global_game.explo
func _fixed_process(delta):
	timers+=delta
	if timers>=bul_freq:
		
		var nb=bt.instance()
		get_parent().add_child(nb)
		nb.set_translation(get_translation())
		nb.look_at(global_game.player.get_global_transform().origin,Vector3(0,1,0))
		timers=0
		var nm=(global_game.player.get_global_transform().origin-nb.get_global_transform().origin).normalized()
		nb.set_linear_velocity(10*nm)

	antim+=delta
	sinai(antim*1.5*90)

	if hp<=0:
		queue_free()
	
	if is_colliding():
		if get_collider().is_in_group("player"):
			global_game.hp-=20
			queue_free()
		elif get_collider().is_in_group("shield"):
			global_game.shield-=10
			get_collider().get_parent().get_node('AnimationPlayer2').play('shield show')
			queue_free()
			


func _on_enemy1_exit_tree():
	if !outdy:
		var expl=explo.instance()
		
		
		get_parent().add_child(expl)
		
		expl.set_global_transform(get_global_transform())
		expl.get_node("Particles").set_emitting(true)
		global_game.coins+=rewardcoin
	# replace with function body
	
	var val=rand_range(0,1)
	if val>0.9:
		print('    ')
		randomize()
		var b=randi()%global_game.pickup.size()
		var pick=global_game.pickup[b].instance()
		get_parent().add_child(pick)
		pick.speed=speed
		pick.set_translation(get_translation())
			
func chaseai():
	var small_move=Vector3(0,(get_global_transform().origin-global_game.player.get_global_transform().origin).y,(get_global_transform().origin-global_game.player.get_global_transform().origin).z)
	
	move_to(get_global_transform().origin-0.000005*global_game.score*small_move.normalized())
	set_rotation_deg(Vector3(0,0,-30*0.0005*global_game.score*small_move.z))

func sinai(angle):
	
	move(0.03*Vector3(30*speed,ysin*sin(deg2rad(angle)),xsin*sin(deg2rad(angle))))
	set_rotation_deg(Vector3(-15*xsin*sin(deg2rad(angle)),0,15*ysin*sin(deg2rad(angle))))