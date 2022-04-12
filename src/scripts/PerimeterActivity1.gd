extends Button

#path for button
export var reference_path = ""
#which button you focus on by default
export(bool) var start_focused = false

# onready var node2D = get_parent().get_node("Node2D")

func _ready():
	if(start_focused):
		grab_focus()
		
	connect("mouse_entered", self, "_on_Button_mouse_entered")
	connect("pressed", self, "_on_Button_Pressed")


func _on_Button_mouse_entered():
	grab_focus()

#when you press on the button you get a path
#else quit if theres nothing 
func _on_Button_Pressed():
	if(reference_path != ""):
		# self.disabled = true
		# save_scene()
		get_tree().change_scene(reference_path)
	#else:
		#get_tree().quit()
