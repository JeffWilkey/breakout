extends Node2D

@export var wall_scene: PackedScene
@export var brick_scene: PackedScene
@export var row_count: int

var screen_size;

func _ready():
	screen_size = get_viewport_rect().size
	_init_walls()
	_place_bricks(level_1())

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

func _place_bricks(level):
	row_count = level.size()
	for row in row_count:
		for col in level[row].size():
			if (level[row][col] != null):
				var brick = brick_scene.instantiate()
				var brick_size = Vector2(48, 10)
				var brick_spawn_location = Vector2(col * brick_size.x, row * brick_size.y)
				
				brick.call("create", brick_spawn_location, brick_size, 2.0, level[row][col].color, level[row][col].hp)
				brick.visible = true
				add_child(brick)

func _full_row(brick, cols: int):
	var row = []
	for n in cols:
		row.push_back({ "color": brick.color, "hp": brick.hp })
	
	return row

## Levels
# Each level is an array and each row in the level is another array of dictionaries
# Each dictionary translates to a brick w/ a `color` and `hp` property
# `color` expects a hexcode
# `hp` expects a health amount

func level_1():
	var blue = { "color": "#22559c", "hp": 10 }
	var blue_light = { "color": "#626fe6", "hp": 10 }
	var red = { "color": "#f27370", "hp": 10 }
	var orange = { "color": "#fa9856", "hp": 10 }
	var yellow = { "color": "#ede862", "hp": 10 }
	var green = { "color": "#5be7a9", "hp": 10 }
	var charcoal = { "color": "#392f2f", "hp": 10 }
	var forest = { "color": "#3a7563", "hp": 10 }
	var forest_light = { "color": "#59a985", "hp": 10}
	
	return [
		_full_row(blue, 10),
		_full_row(blue_light, 10),
		_full_row(red, 10),
		[orange, null, orange, null,orange, orange, null, orange, null, orange],
		[yellow, yellow, yellow,null, yellow, yellow, null, yellow, yellow, yellow],
		[null],
		[null],
		[null],
		[null],
		[charcoal, null, charcoal, charcoal, charcoal, charcoal, charcoal, charcoal, null, charcoal],
		[forest, null, forest, forest, forest, forest, forest, forest, null, forest],
		[forest_light, null, forest_light, forest_light, forest_light, forest_light, forest_light, forest_light, null, forest_light],
		_full_row(green, 10)
	]
