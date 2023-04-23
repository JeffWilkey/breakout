extends Node2D

@export var wall: PackedScene
var screen_size;

func _ready():
	screen_size = get_viewport_rect().size
	_init_walls()

# Add walls around play area
func _init_walls():
	var wall_left = wall.instantiate()
	var wall_right = wall.instantiate()
	var wall_top = wall.instantiate()
	
	wall_left.call("create", Vector2(2, screen_size.y), Vector2(0, 0))
	wall_right.call("create", Vector2(2, screen_size.y), Vector2(screen_size.x + 2, 0))
	wall_top.call("create", Vector2(screen_size.x, 2), Vector2(screen_size.x, -2))
	
	add_child(wall_left)
	add_child(wall_right)
	add_child(wall_top)
