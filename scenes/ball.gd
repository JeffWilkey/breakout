extends RigidBody2D

class_name Ball

@export var damage = 10
var speed = 350
var direction = Vector2(0, 1)

	
func _physics_process(delta):
	var velocity = speed * direction * delta
	var collision = move_and_collide(velocity)
	if (collision):
		bounce_off(collision)

func set_direction(new_direction: Vector2):
	if (!new_direction.is_normalized()):
		new_direction = new_direction.normalized()
	direction = new_direction

func reset_ball(pos):
	set_direction(Vector2(randf_range(-0.2, 0.2), randf_range(-0.2, 0.2)))
	position = pos

func start(pos):
	reset_ball(pos)
	
func bounce_off(collision: KinematicCollision2D):
	if (collision.get_collider_velocity() != Vector2.ZERO):
		direction.x = calculate_collider_influence(collision.get_collider_velocity())
	direction = direction.bounce(collision.get_normal())

func calculate_collider_influence(collider_velocity: Vector2) -> float:
	var influenced_direction = direction + collider_velocity
	return influenced_direction.normalized().x
