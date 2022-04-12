extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var _wd = $CorrectWindowDialog

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_ENTER:
			print("Enter was pressed")
			_wd.popup_centered()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
