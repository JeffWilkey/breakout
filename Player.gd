extends Node

@export var lives: int = 3
@export var current_lives: int = lives
@export var score: int = 0

func lose_life():
	lives -= 1

func add_life():
	lives += 1

func add_score(amt: int):
	score += amt
