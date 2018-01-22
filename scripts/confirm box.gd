extends Patch9Frame

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var payment
var nval
var variableg
var nodeg
var price1
func _ready():
	global_game.cbox=self
	# Called every time the node is added to the scene.
	# Initialization here
	if OS.get_name()=='Android':
		payment = Globals.get_singleton("GodotPayments")
		if Globals.has_singleton("GodotPayments"):
			print("godot payments v3 found")
		else:
			print("not found")
		payment.setPurchaseCallbackId(get_instance_ID())
		payment.setAutoConsume(false)
		payment.requestPurchased()
func showbox(itemname,price,variable,node,newvalue):
	set_hidden(false)
	get_node("name").set_text(itemname)
	get_node("price").set_text('Cost: '+str(price))
	variableg=variable
	nodeg=node
	price1=price
	nval=newvalue
	get_node("coin").set_text('Available: '+str(global_game.coins))
	if global_game.coins>=price:
		get_node("ok").set_disabled(false)
	else:
		get_node("ok").set_disabled(true)


func _on_no_pressed():
	set_hidden(true) # replace with function body
	
	if false:
		if OS.get_name()=='Android':
			print('IAP tesst')
			if Globals.has_singleton("GodotPayments"):
				print("godot payments v3 found")
			else:
				print("Godot Payments not found")
			
			IAP.connect("sku_details_complete",self,"sku_details_complete")
			IAP.connect("purchase_success",self,"purchase_success_callback")
			IAP.purchase("coins_10000")
			
			

func _on_ok_pressed():
	set_hidden(true) # replace with function body
	global_game.coins-=price1
	nodeg.buying_done(nval)
	global_game.savecoin()
	
	
#IAP
func do_intent():
	pass
	
func purchase_success(receipt, signature, sku):
	print("purchase_success : ", sku)
	
func purchase_fail():
	print("purchase_fail")
	
func purchase_cancel():
	print("purchase_cancel")
func purchase_owned(sku):
	print("purchase_owned : ", sku)
	IAP.consume("coins_10000")
	global_game.coins+=10000
func consume_success(receipt, signature, sku):
	print("consume_success : ", sku)
func has_purchased(receipt, signature, sku):
	if sku == "":
		print("has_purchased : nothing")
	else:
		print("has_purchased : ", sku)


#IAP 2
func sku_details_complete():
	print(IAP.sku_details)
	IAP.purchase('coins_10000')
func purchase_success_callback(item):
	global_game.coins+=10000
