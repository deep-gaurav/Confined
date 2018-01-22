extends Node

var enable_ads=false
var player1
var high_graphics=true
var spark
var rocketpickup
var re=true
var UI
var roc
var menuactive=false
var cbox
var curshipmatnode=null
var materials=null
var bought=false
var tmp_buy_var
var shipdicts={'no.':1,'max_hp':100,'shield_tim':0,'max_bullet':100,'drones':0,'price':0}
var curshipnum=0
var firebase
var coins=0
var global_music=60
var global_fx=60
var joysticksensitivity=0.3
var generator
var wave=1
var rockets=200
var explo
var bt
var shield_m
var pickup
var eap
var currentwall
var root
var bullets=100
var maxbullets=100
var joy=true
var player
var angle=0
var hp=100
var over=false
var shield=0
var score=0
func _ready():
	if OS.get_name()=="HTML5":
		high_graphics=false
	spark=load('res://scenes/spark.tscn')
	if curshipnum==0:
		curshipnum=1
	shield_m=load("res://scenes/shield.tscn")
	bullets=100
	pickup=[load("res://scenes/shield pickup.tscn"),load("res://scenes/rocket pickup.tscn"),load("res://scenes/health pickup.tscn")]
	bt=load('res://scenes/bullet2.tscn')
	explo=load("res://scenes/explosion.tscn")
	joysticksensitivity=0.2
	roc=0
	loadval()
	loadcoin()
	loadcolour()
	loaddicts()
	if curshipnum==0:
		curshipnum=1
	print(shipdicts)
	hp=shipdicts['max_hp']
func loadval():
	var fread=File.new()
	if fread.file_exists("user://data.sav"):
		fread.open("user://data.sav",File.READ)
		global_music=float(fread.get_line())
		global_fx=float(fread.get_line())
		joysticksensitivity=float(fread.get_line())
		curshipnum=int(fread.get_line())
		enable_ads=bool(fread.get_line())
		print("ads enabled : ",enable_ads)
		fread.close()
	
func loadcoin():
	var fread=File.new()
	if fread.file_exists("user://coin.sav"):
		fread.open("user://coin.sav",File.READ)
		coins=int(fread.get_line())
		fread.close()
		
func savecoin():
	var fread=File.new()
	fread.open("user://coin.sav",File.WRITE)
	fread.store_line(str(coins))
func saveval():
	savedic()
	var fread=File.new()
	
	fread.open("user://data.sav",File.WRITE)
	fread.store_line(str(global_music))
	fread.store_line(str(global_fx))
	fread.store_line(str(joysticksensitivity))
	fread.store_line(str(curshipnum))
	fread.store_line(str(enable_ads))
	fread.close()
	
func savecolour():
	var nd={}
	nd['mat1']=[materials[0].r,materials[0].g,materials[0].b]
	nd['mat2']=[materials[1].r,materials[1].g,materials[1].b]
	var ts=nd.to_json()
	var fr=File.new()
	fr.open("user://color.sav",File.WRITE)
	fr.store_string(ts)
	fr.close()
	
func loadcolour():
	var fr=File.new()
	if fr.file_exists("user://color.sav"):
		fr.open("user://color.sav",File.READ)
		var nd={}
		nd.parse_json(fr.get_line())
		materials=[null,null]
		materials[0]=Color(nd['mat1'][0],nd['mat1'][1],nd['mat1'][2])
		materials[1]=Color(nd['mat2'][0],nd['mat2'][1],nd['mat2'][2])

func savedic():
	var fl=File.new()
	fl.open("user://curshipdic",File.WRITE)
	fl.store_line(shipdicts.to_json())
	fl.close()
	
func loaddic():
	
	var fl=File.new()
	if fl.file_exists("user://curshipdic"):
		fl.open("user://curshipdic",File.READ)
		shipdicts.parse_json(fl.get_line())
		fl.close()
	loaddicts()
func loaddicts():
	print('.......................')
	var fi=File.new()
	var ship1={};var ship2={};var ship3={};var ship4={}; var ship5={}
	var lst=[ship1,ship2,ship3,ship4,ship5]
	if fi.file_exists('user://ships.sav'):
		fi.open('user://ships.sav',File.READ)
		ship1.parse_json(fi.get_line())
		ship2.parse_json(fi.get_line())
		ship3.parse_json(fi.get_line())
		ship4.parse_json(fi.get_line())
		ship5.parse_json(fi.get_line())
		fi.close()
		if ship1.size()!=0:
			shipdicts=lst[curshipnum-1]
	print(lst)
	
