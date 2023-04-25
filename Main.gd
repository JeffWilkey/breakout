extends Node

func _ready():
	$GameManager.call("new_game", Vector2(get_viewport().size.x / 2, $LevelManager.get("row_count") * 15) )
	

