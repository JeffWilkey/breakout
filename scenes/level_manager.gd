extends Node2D

@export var wall_scene: PackedScene
@export var brick_scene: PackedScene
@export var brick_rows = [
	"#8ef6e4",
	"#9896f1",
	"#d59bf6",
	"#edb1f1"
]

var screen_size;

func _ready():
	screen_size = get_viewport_rect().size
	_init_walls()
	_place_bricks()

# Add walls around play area
func _init_walls():
	var wall_left = wall_scene.instantiate()
	var wall_right = wall_scene.instantiate()
	var wall_top = wall_scene.instantiate()
	
	wall_left.call("create", Vector2(2, screen_size.y), Vector2(0, 0))
	wall_right.call("create", Vector2(2, screen_size.y), Vector2(screen_size.x + 2, 0))
	wall_top.call("create", Vector2(screen_size.x, 2), Vector2(screen_size.x, -2))
	
	add_child(wall_left)
	add_child(wall_right)
	add_child(wall_top)

func _place_bricks():
	for n in brick_rows.size():
		for i in 10:
			var brick = brick_scene.instantiate()
			var brick_size = Vector2(48, 10)
			var brick_spawn_location = Vector2(i * brick_size.x, n * brick_size.y)
			brick.call("create", brick_spawn_location, brick_size, 2.0, brick_rows[n])
			brick.visible = true
			add_child(brick)
