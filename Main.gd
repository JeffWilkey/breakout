extends Node

@export var brick_scene: PackedScene
@export var ball_scene: PackedScene
@export var brick_rows = [
	"#8ef6e4",
	"#9896f1",
	"#d59bf6",
	"#edb1f1"
]

var ball
var ball_start_pos

func _ready():
	new_game()
	
func _process(delta):
	if (ball && ball.position.y > get_viewport().size.y):
		ball.call("reset_ball", ball_start_pos)
		$Player.call("lose_life")
	
func new_game():
	# Set start positions for paddle and ball
	$Paddle.start(Vector2(get_paddle_start_x(), get_viewport().size.y - 64))
	
	# Add ball to scene and set start position
	ball = ball_scene.instantiate()
	ball_start_pos = Vector2(get_viewport().size.x / 2 + 24, brick_rows.size() * 10 + 64)
	ball.call("start", ball_start_pos)
	add_child(ball)

	# Build level
	lay_bricks()
	
func lay_bricks():
	for n in brick_rows.size():
		var col_position = Vector2.ZERO
		for i in 10:
			var brick = brick_scene.instantiate()
			var brick_spawn_location = Vector2(i * brick.get_node("BrickOuter").size.x, n * brick.get_node("BrickOuter").size.y + 30)
			
			brick.position.x = brick_spawn_location.x
			brick.position.y = brick_spawn_location.y
			brick.call("update_color", brick_rows[n])
			brick.visible = true
			add_child(brick)

func get_paddle_start_x():
	return get_viewport().size.x / 2 - ($Paddle/ColorRect.size.x / 2)
