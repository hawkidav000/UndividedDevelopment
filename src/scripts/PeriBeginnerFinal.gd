extends Node2D


var ButtonArray = []

onready var _Next = $NETXButton

onready var _wa = $WrongAns
onready var _ra = $RightAns
onready var _ooa = $OutofAttempts

# onready var _wa = get_parent().get_node("WrongAns")
# onready var _ra = get_parent().get_node("RightAns")
# onready var _ooa = get_parent().get_node("OutofAttempts")

var _Num_Attempts = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	ButtonArray = get_tree().get_nodes_in_group("AnswerButtons")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Option1_pressed():
	if _Num_Attempts < 1:
		_Num_Attempts = _Num_Attempts + 1
		_wa.popup_centered()
	else:
		for button in ButtonArray:
			button.disabled = true
		
		_Next.disabled = false
		
		_ooa.popup_centered()
	

func _on_Option2_pressed():
	if _Num_Attempts < 1:
		_Num_Attempts = _Num_Attempts + 1
		_wa.popup_centered()
	else:
		for button in ButtonArray:
			button.disabled = true
		_Next.disabled = false
		
		_ooa.popup_centered()
	
func _on_Option3_pressed():
	_ra.popup_centered()
	
	for button in ButtonArray:
		button.disabled = true
	_Next.disabled = false
	
func _on_Option4_pressed():
	if _Num_Attempts < 1:
		_Num_Attempts = _Num_Attempts + 1
		_wa.popup_centered()
	else:
		for button in ButtonArray:
			button.disabled = true
		
		_Next.disabled = false
		
		_ooa.popup_centered()
