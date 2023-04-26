extends Node2D

signal lose_life
signal game_over

@export var ball_scene: PackedScene
@export var paddle_scene: PackedScene
@export var lives = 3

var _ball
var _ball_start_pos
var _paddle

var _game_over = false

func _process(_delta):
	if (!_game_over && _ball && _ball.position.y > get_viewport().size.y):
		lives -= 1
		lose_life.emit()
		if (lives > 0):
			_ball.call("reset_ball", _ball_start_pos)
		else:
			game_over.emit()
			reset_game()
			

func new_game(ball_start_pos: Vector2):
	_game_over = false
	_ball_start_pos = ball_start_pos
	# Add paddle to scene and set start position
	_paddle = paddle_scene.instantiate()
	_paddle.call("start", Vector2(get_paddle_start_x(), get_viewport().size.y - 64))
	add_child(_paddle)

	# Add ball to scene and set start position
	_ball = ball_scene.instantiate()
	_ball.call("start", _ball_start_pos)
	add_child(_ball)

func get_paddle_start_x():
	return get_viewport().size.x / 2 - (_paddle.get_node("ColorRect").size.x / 2)
	
func reset_game():
	_game_over = true
	_ball.queue_free()
	_paddle.queue_free()
	lives = 3
	
