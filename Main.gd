extends Node

@export var brick_scene: PackedScene
@export var ball_scene: PackedScene
@export var paddle_scene: PackedScene

var paddle
var ball
var ball_start_pos

func _ready():
	new_game()
	
func _process(_delta):
	if (ball && ball.position.y > get_viewport().size.y):
		ball.call("reset_ball", ball_start_pos)
	
func new_game():
	# Add paddle to scene and set start position
	paddle = paddle_scene.instantiate()
	paddle.call("start", Vector2(get_paddle_start_x(), get_viewport().size.y - 64))
	add_child(paddle)

	# Add ball to scene and set start position
	ball = ball_scene.instantiate()
	ball_start_pos = Vector2(get_viewport().size.x / 2, 100)
	ball.call("start", ball_start_pos)
	add_child(ball)
	


func get_paddle_start_x():
	return get_viewport().size.x / 2 - (paddle.get_node("ColorRect").size.x / 2)
