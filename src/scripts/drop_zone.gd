extends Position2D

var fill = false

func _draw():
	# draws the hollowed drop zones
	draw_arc(Vector2.ZERO, 15, deg2rad(0), deg2rad(360), 100, Color.whitesmoke, 5)

func select():
	fill = true
