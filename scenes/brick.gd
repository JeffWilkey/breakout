extends StaticBody2D

func break_brick():
	queue_free()

func update_color(color):
	$BrickOuter.color = Color.from_string(color, Color.RED).darkened(0.2)
	$BrickInner.color = Color.from_string(color, Color.BLUE)
	
func create(pos = Vector2(0, 0), size = Vector2(64, 16), padding = 4.0, color = "#00ff00"):
	position = pos
	
	$BrickOuter.size = size
	$BrickInner.size = Vector2(size.x - padding * 2, size.y - padding * 2)
	$BrickInner.position = Vector2(padding, padding)
	$BrickOuter.color = Color.from_string(color, Color.RED).darkened(0.2)
	$BrickInner.color = Color.from_string(color, Color.BLUE)
	
func _on_area_2d_body_exited(body):
	if body is Ball:
		break_brick()
