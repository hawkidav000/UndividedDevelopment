extends Area2D

export var group := "dragable"

var _touch_position := Vector2.ZERO
var _dragging := false
var rest_point
var rest_nodes = []

onready var _sprite := $Sprite

onready var _ps = get_parent().get_node("PeppermintSound")

# initializes the list of drop zones and sets the starting rest point to be the first drop zone
func _ready() -> void:
	add_to_group(group)
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[0].global_position

# sets the physics for the sprite to move when the mouse button is let go
func _physics_process(delta):
	if not _dragging:
		global_position = lerp(global_position, rest_point, 10 * delta)
		
# checks if the mouse button gets released
func _input(event) -> void:
	if not _dragging:
		return
	
	if event.is_action_released("ui_touch"):
		_dragging = false
		# shortest distance is the pixel radius the sprite will chose a new rest point
		var shortest_dist = 40
		# checks if in the radius of a drop zone, sets that zone as filled, and disables the collision box
		for child in rest_nodes:
			# checks distance of each node to where the mouse is
			var distance = global_position.distance_to(child.global_position)
			# if mouse is within radius
			if distance < shortest_dist and child.fill == false:
					child.select()
					get_node("CollisionPolygon2D").disabled = true
					rest_point = child.global_position
					shortest_dist = distance
					
					_ps.play()
	
	if event is InputEventMouseMotion:
		position -= _touch_position - (event.position)
		_touch_position = event.position

# activates on mouse click
func _on_input_event(_viewport, event, _shape_idx) -> void:
	if event.is_action_pressed("ui_touch"):
		if _is_on_top():
			_dragging = true
			_touch_position = event.position
			
			_ps.play()

# identifies the sprite on the top of the stack
func _is_on_top() -> bool:
	for dragable in get_tree().get_nodes_in_group(group + "hovered"):
		if dragable.get_index() > get_index():
			return false
	
	return true

# checks if mouse is over the sprite
func _on_mouse_entered() -> void:
	add_to_group(group + "hovered")

# checks when mouse leaves sprite area
func _on_mouse_exited() -> void:
	remove_from_group(group + "hovered")

