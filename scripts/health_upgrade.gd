extends Button

## class member variables go here, for example:
var sn
var shipshield

func _ready():
	sn=get_parent().get_parent().get_parent().get_node("Control/Viewport/Spatial/ships")
	shipshield=sn.ships[sn.currentship]['max_hp']
	set_process(true)
	
func _process(delta):
	shipshield=sn.ships[sn.currentship]['max_hp']
	var snn=shipshield/100-1
	sn.savedicts()
	if snn<3:
		set_disabled(false)
	else:
		set_disabled(true)
	if true:
		for x in range(3):
			var n=get_parent().get_node(str(x+1))
			if x+1<=snn:
				n.set_modulate(Color('2592fc'))
			else:
				n.set_modulate(Color('ffffff'))
			
func _on_shieldbutton_pressed():

		global_game.cbox.showbox('health upgrade',(shipshield/100+1)*4000,'',self,shipshield/100+1)

func buying_done(nval):
	sn.ships[sn.currentship]['max_hp']=nval*100
	sn.savdi()

func _on_health_upgrade_pressed():
	_on_shieldbutton_pressed()
