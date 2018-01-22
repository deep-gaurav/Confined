extends Node
var admob
func _ready():
	if OS.get_name()=="Android" and global_game.enable_ads:
		if Globals.has_singleton("AdMob"):
			admob=Globals.get_singleton("AdMob")
		admob.init(true,get_instance_ID())
		admob.loadBanner("ca-app-pub-1962467517034637/4076197535", false)
		admob.loadInterstitial("ca-app-pub-1962467517034637/6656815765")
		show_banner()
func show_banner():
	if OS.get_name()=="Android":
		admob.showBanner()
func hide_banner():
	if OS.get_name()=="Android":
		admob.hideBanner()

func show_interstitial():
	if OS.get_name()=="Android":
		admob.showInterstitial()
	
func _on_interstitial_close():
	if OS.get_name()=="Android":
		admob.loadInterstitial("ca-app-pub-1962467517034637/6656815765")