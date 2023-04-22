extends StaticBody2D

func break_brick():
	queue_free()

func update_color(color):
	$BrickOuter.color = Color.from_string(color, Color.RED).darkened(0.2)
	$BrickInner.color = Color.from_string(color, Color.BLUE)

func _on_area_2d_body_exited(body):
	if body is Ball:
		break_brick()
