extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#which button you focus on by default
export(bool) var start_focused = false

# onready var _le = $UserAnswerLineEdit
onready var _cwd = $CorrectWindowDialog
onready var _iwd = $IncorrectWindowDialog
onready var _nawd = $NoAttemptsWindowDialog
onready var _back = get_parent().get_node("BackButton")

onready var _le = get_parent().get_node("UserAnswerLineEdit")

var numAttempts = 0

# var lineEditAnswer = get_node("../UserAnswerLineEdit").get_text()

# var lineEditAnswer = String(_le.get_text())

# Called when the node enters the scene tree for the first time.	
func _ready():
	if(start_focused):
		grab_focus()
		
	connect("mouse_entered", self, "_on_Button_mouse_entered")
	connect("pressed", self, "_on_Button_Pressed")
	
func _on_Button_mouse_entered():
	grab_focus()

func _on_Button_Pressed():
	
	numAttempts = numAttempts + 1
	
	if _le.text == "21":
		_cwd.popup_centered()
		self.disabled = true
		_back.disabled = false
	else:
		if numAttempts < 2:
			_iwd.popup_centered()
		else:
			_nawd.popup_centered()
			self.disabled = true
			_back.disabled = false
	print("Enter button was pressed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
