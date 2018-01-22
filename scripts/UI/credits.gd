extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var text
func _ready():
	text=false

func _process(delta):
	pass
func _on_credits_visibility_changed():
	if is_visible():
		get_node("RichTextLabel").set_scroll_follow(true)
		set_process(true)
		