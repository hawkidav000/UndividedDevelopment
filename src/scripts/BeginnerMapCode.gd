extends Node2D


onready var _AA1 = $Area1
onready var _AA2 = $Area2
onready var _PA1 = $PerimeterActivity1
onready var _PA2 = $PerimeterActivity2
onready var _Final = $Final

var L1 = []


# Called when the node enters the scene tree for the first time.
func _ready():
	L1 = get_tree().get_nodes_in_group("L1")


func save_scene():
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://src/StartUpScreen/BeginnerChallenge/BeginnerMap2.tscn", packed_scene)


func _on_PerimeterActivity1_pressed():
	for button in L1:
		button.disabled = true
	_AA2.disabled = false
	save_scene()


func _on_Area1_pressed():
	for button in L1:
		button.disabled = true
	_PA2.disabled = false
	save_scene()


func _on_PerimeterActivity2_pressed():
	_PA2.disabled = true
	_Final.disabled = false
	save_scene()


func _on_Area2_pressed():
	_AA2.disabled = true
	_Final.disabled = false
	save_scene()
