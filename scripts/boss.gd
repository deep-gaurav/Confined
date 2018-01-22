extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var movepoint=Vector3(0,0,0)
var recover
var firespeed=5
var hp
var cannon
var direction
var ray1;var ray2
var bullet
var hpbar
func _ready():
	move_gen()
	bullet=load("res://scenes/bossbullet.tscn")
	hpbar=get_node("hp")
	hp=400
	set_fixed_process(true)
	cannon=load("res://scenes/cannon.tscn")

func _fixed_process(delta):
	if !global_game.player.is_visible():
		
		queue_free()
		set_fixed_process(false)
	direction=(global_game.player.get_global_transform().origin-get_global_transform().origin).normalized()
	if hp<=0:
		queue_free()
		
	move(0.05*movepoint)
	if is_colliding():
		move_gen()
	var ab=0.2037
	hpbar.set_scale(Vector3(ab*(hp/400.0),ab,ab))
func bulfire():
	for x in ['1','2']:
		var nb=bullet.instance()
		get_parent().add_child(nb)
		nb.set_translation(get_translation()+get_node("pt"+x).get_translation())
		nb.set_linear_velocity(firespeed*Vector3(1,0,0))
func _on_Timer_timeout():
	var ncan= cannon.instance()
	get_parent().add_child(ncan)
	ncan.set_translation(get_translation())
	ncan.set_linear_velocity(firespeed*direction)
	move_gen()
func _on_Area_body_enter( body ):
	if body.is_in_group('player'):
		bulfire()
		get_node("bull").start()


func _on_bull_timeout():
	bulfire()


func _on_Area_body_exit( body ):
	get_node("bull").stop()

func move_gen():
	randomize()
	var up=rand_range(-1,1)
	randomize()
	var side=rand_range(-1,1)
	movepoint=Vector3(0,up,side)
	if is_colliding():
		movepoint=movepoint+get_collision_normal()*0.1

func _on_boss_exit_tree(): #death
	var death=load('res://scenes/bossblast.tscn').instance()
	get_parent().add_child(death)
	death.set_translation(get_translation())
	death.set_emitting(true)