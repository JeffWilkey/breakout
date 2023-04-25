extends CharacterBody2D

@export var speed = 600
var screen_size

# Change this to CharacterBody or Rigidbody to be able to accurately keep track of velocity;

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(_delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1

	velocity *= speed
	
	move_and_slide()

	position.x = clamp(position.x, 0, screen_size.x - $ColorRect.size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	

func start(pos):
	position = pos

