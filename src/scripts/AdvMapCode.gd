extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var _PA1 = $PerimeterActivity1
onready var _PA2 = $PerimeterActivity2
onready var _PA3 = $PerimeterActivity3
onready var _A1 = $Area1
onready var _A2 = $Area2
onready var _A3 = $Area3
onready var _VA1 = $VolumeActivity1
onready var _VA2 = $VolumeActivity2
onready var _VA3 = $VolumeActivity3
onready var _Final = $Final

# Arrays used to hold the groups of buttons
var L1 = []
var L2 = []
var L3 = []
var C1 = []
var C2 = []
var C3 = []

# Called when the node enters the scene tree for the first time.
func _ready():
	L1 = get_tree().get_nodes_in_group("Level1")
	L2 = get_tree().get_nodes_in_group("Level2")
	L3 = get_tree().get_nodes_in_group("Level3")
	C1 = get_tree().get_nodes_in_group("Column1")
	C2 = get_tree().get_nodes_in_group("Column2")
	C3 = get_tree().get_nodes_in_group("Column3")
	


func save_scene():
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://src/StartUpScreen/AdvancedMap2.tscn", packed_scene)
	

func _on_PerimeterActivity1_pressed():
	for button in L1:
		button.disabled = true
		button.set_focus_mode(0)
#	for button in C1:
#		button.disabled = true
#	for button in C3:
#		button.disabled = true
	_VA2.disabled = false
	save_scene()


func _on_Area1_pressed():
	for button in L1:
		button.disabled = true
#	for button in C2:
#		button.disabled = true
#	for button in C3:
#		button.disabled = true
	_PA2.disabled = false
	save_scene()


func _on_VolumeActivity1_pressed():
	for button in L1:
		button.disabled = true
#	for button in C1:
#		button.disabled = true
#	for button in C2:
#		button.disabled = true
	_A2.disabled = false
	save_scene()


func _on_PerimeterActivity2_pressed():
	_VA3.disabled = false
	_PA2.disabled = true
	save_scene()


func _on_Area2_pressed():
	_A2.disabled = true
	_PA3.disabled = false
	save_scene()


func _on_VolumeActivity2_pressed():
	_A3.disabled = false
	_VA2.disabled = true
	save_scene()


func _on_PerimeterActivity3_pressed():
	_PA3.disabled = true
	_Final.disabled = false
	save_scene()


func _on_Area3_pressed():
	_A3.disabled = true
	_Final.disabled = false
	save_scene()


func _on_VolumeActivity3_pressed():
	_VA3.disabled = true
	_Final.disabled = false
	save_scene()

