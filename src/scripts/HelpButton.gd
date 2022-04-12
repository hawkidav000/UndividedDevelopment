extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(bool) var start_focused = false

onready var _hwd = $HelpWindowDialog

# Called when the node enters the scene tree for the first time.
func _ready():
	if(start_focused):
		grab_focus()
		
	connect("mouse_entered", self, "_on_Button_mouse_entered")
	connect("pressed", self, "_on_Button_Pressed")
	
func _on_Button_mouse_entered():
	grab_focus()
	
func _on_Button_Pressed():
	_hwd.popup_centered()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
