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
	
func _process(_delta):
	if (ball && ball.position.y > get_viewport().size.y):
		ball.call("reset_ball", ball_start_pos)
	
func new_game():
	# Set start positions for paddle and ball
	$Paddle.start(Vector2(get_paddle_start_x(), get_viewport().size.y - 64))
	
	# Add ball to scene and set start position
	ball = ball_scene.instantiate()
	ball_start_pos = Vector2(get_viewport().size.x / 2, 100)
	ball.call("start", ball_start_pos)
	add_child(ball)

	# Build level
	lay_bricks()
	
func lay_bricks():
	for n in brick_rows.size():
		for i in 10:
			var brick = brick_scene.instantiate()
			var brick_size = Vector2(48, 10)
			var brick_spawn_location = Vector2(i * brick_size.x, n * brick_size.y)
			brick.call("create", brick_spawn_location, brick_size, 2.0, brick_rows[n])
			brick.visible = true
			add_child(brick)

func get_paddle_start_x():
	return get_viewport().size.x / 2 - ($Paddle/ColorRect.size.x / 2)
