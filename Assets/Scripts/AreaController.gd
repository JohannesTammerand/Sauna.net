extends Node2D

@onready var player = %Player
var playerInSauna = false
var saunaHeat = 1
var playerInBath = false

func _process(_delta):
	if playerInSauna:
		player.heat = min(player.heat + saunaHeat, 1000)
	elif playerInBath:
		player.heat = max(player.heat - 1.5, 0)
	else:
		player.heat = max(player.heat-0.5, 0)


func _on_shower_body_entered(_body):
	player.slippery = true


func _on_shower_body_exited(_body):
	player.slippery = false


func _on_cold_bath_body_entered(_body):
	playerInBath = true


func _on_cold_bath_body_exited(_body):
	playerInBath = false


func _on_sauna_body_entered(_body):
	playerInSauna = true


func _on_sauna_body_exited(_body):
	playerInSauna = false
