extends Area2D

@onready var player = %Player
var playerIn = false

func _process(_delta):
	if playerIn:
		player.heat = min(player.heat + 1, 1000)
	else:
		player.heat = max(player.heat - 0.5, 0)

func _on_body_entered(_body):
	playerIn = true

func _on_body_exited(_body):
	playerIn = false
