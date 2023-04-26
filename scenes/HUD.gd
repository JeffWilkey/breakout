extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over!")
	
	$Lives.hide()
	
	await $MessageTimer.timeout
	$MessageTimer.stop()
	
	$Message.text = "Breakout Example\nGodot 4"
	$Message.show()
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()	

func update_lives(lives: int):
	$Lives.text = str("Lives: ", lives)
	
func start(lives: int):
	update_lives(lives)
	$Lives.show()
	show_message("Get ready")

func _on_message_timer_timeout():
	$Message.hide()

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()
