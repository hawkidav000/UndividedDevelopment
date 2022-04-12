extends Button

export(bool) var start_focused = false
export var reference_path = ""

onready var goBack = $ConfirmationDialog

func _ready():
	if(start_focused):
		grab_focus()
		
	connect("mouse_entered", self, "_on_Button_mouse_entered")
	connect("pressed", self, "_on_Button_Pressed")

func _on_Button_mouse_entered():
	grab_focus()
	
func _on_Button_Pressed():
	goBack.popup_centered()

func _on_ConfirmationDialog_confirmed():
	get_tree().change_scene(reference_path)
