"""

#if node is kinematic body 2d then it must extend kinematicbody 2d or its child
extends KinematicBody2D
class_name Actor

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#variable to update velocity at each frame
#gravity is a vertical acceleration
#var gravity = 3000.0


export var speed = Vector2(300.0,100.0)
#MAKE THE GRAVITY CONFIGURABLE USE EXPORT KEYWORD
export var gravity = 300.0


#.zero : by default the character will not move
var velocity: = Vector2.ZERO

#want character to move 0 pixels on y axis and 300 pixels on the x
#var velocity: = Vector2(300,0)


#generally where you want to place player movement
#everything that invlolves physics detect floor colide etc
func _physics_process(delta):
	#delta represents the time elapsed since the previous frame
	#useful for if the game slows down/ scence is heavy character moves at same speed
	#add the accelaration of gravity to velocity y component
	#MAKES CHARACTER FALL DOWN
	#workes with vector2.zero
	velocity.y += gravity * delta
	#if you hit a wall or slope it creates a new velocity for player
	velocity.y = max(velocity.y, speed.y)
	#move character based on value stored in velocity variable
	velocity = move_and_slide(velocity)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

"""
