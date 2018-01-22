extends Spatial

# class member variables go here, for example:
# var a = 2
var main
var currentship=0
var ship1;var ship2;var ship3;var ship4;var ship5
var ships
var cur=0
var curan=[0,1,2,3,4,5]
var ourangle=0
func _ready():
	
	# Called every time the node is added to the scene.
	# Initialization here
	main=load("res://scenes/main.tscn")
	set_fixed_process(true)
	ship1={'no.':1,'max_hp':100,'shield_tim':0,'max_bullet':100,'drones':0,'price':0}
	ship2={'no.':2,'max_hp':100,'shield_tim':0,'max_bullet':100,'drones':0,'price':20000}
	ship3={'no.':3,'max_hp':100,'shield_tim':0,'max_bullet':100,'drones':0,'price':50000}
	ship4={'no.':4,'max_hp':100,'shield_tim':0,'max_bullet':100,'drones':0,'price':100000}
	ship5={'no.':5,'max_hp':100,'shield_tim':0,'max_bullet':100,'drones':0,'price':200000}
	ships=[ship1,ship2,ship3,ship4,ship5]
	loaddicts()
func _fixed_process(delta):
	
	if ourangle<cur*72:
		rotate_y(deg2rad(1))
		ourangle+=1
	elif ourangle>cur*72:
		rotate_y(deg2rad(-1))
		ourangle-=1
	else:
		set_fixed_process(false)

func _on_TextureButton_pressed():
	
	cur+=1
	set_fixed_process(true)
	currentship=cur%5
	print(currentship)
func _on_TextureButton1_pressed():
	cur-=1
	set_fixed_process(true) # replace with function body
	currentship=cur%5
	print(currentship)
func savedicts():
	var fi=File.new()
	fi.open("user://ships.sav",File.WRITE)
	fi.store_line(ship1.to_json())
	fi.store_line(ship2.to_json())
	fi.store_line(ship3.to_json())
	fi.store_line(ship4.to_json())
	fi.store_line(ship5.to_json())
	fi.close()
	
func loaddicts():
	var fi=File.new()
	if fi.file_exists('user://ships.sav'):
		fi.open('user://ships.sav',File.READ)
		ship1.parse_json(fi.get_line())
		ship2.parse_json(fi.get_line())
		ship3.parse_json(fi.get_line())
		ship4.parse_json(fi.get_line())
		ship5.parse_json(fi.get_line())
		fi.close()


func _on_Button_pressed():
	savdi()
	get_tree().change_scene_to(load("res://scenes/main.tscn"))
func savdi():

	global_game.curshipnum=ships[currentship]['no.']
	global_game.saveval()
	global_game.savecoin()
	savedicts()
	global_game.shipdicts=ships[currentship]
	
func changecolor(col):
	var mesh=get_node("ship1/fighter1/mesh").get_mesh()
	mesh.surface_get_material(1).set_parameter(FixedMaterial.PARAM_DIFFUSE,col)

func _on_ColorPickerButton_color_changed( color ):
	var mesh=get_node("ship"+str(ships[currentship]['no.'])+"/fighter"+str(ships[currentship]['no.'])+"/mesh").get_mesh()
	mesh.surface_get_material(1).set_parameter(FixedMaterial.PARAM_DIFFUSE,color)
	savecurmat()

func _on_ColorPickerButton2_color_changed( color ):
	var mesh=get_node("ship"+str(ships[currentship]['no.'])+"/fighter"+str(ships[currentship]['no.'])+"/mesh").get_mesh()
	mesh.surface_get_material(2).set_parameter(FixedMaterial.PARAM_DIFFUSE,color)
	savecurmat()
func savecurmat():
	var m=get_node("ship"+str(ships[currentship]['no.'])+"/fighter"+str(ships[currentship]['no.'])+"/mesh").get_mesh()
	global_game.materials=[m.surface_get_material(1).get_parameter(FixedMaterial.PARAM_DIFFUSE),m.surface_get_material(2).get_parameter(FixedMaterial.PARAM_DIFFUSE)]
	global_game.savecolour()