extends Node

func _on_hud_start_game():
	$LevelManager.call("new_game")
	$HUD.start($GameManager.get("lives"))
	$StartTimer.start()
	await $StartTimer.timeout
	$GameManager.call("new_game", Vector2(get_viewport().size.x / 2, $LevelManager.get("row_count") * 15))
	


func _on_game_manager_lose_life():
	$HUD.update_lives($GameManager.get("lives"))


func _on_game_manager_game_over():
	$HUD.show_game_over()
