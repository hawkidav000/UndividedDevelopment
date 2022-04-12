extends Position2D

var fill = false

#func _draw():
#	draw_rect(Rect2(Vector2(-50, -50), Vector2(100, 100)), Color.red, false, 5)
	
func select():
	fill = true
