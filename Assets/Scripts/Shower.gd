extends Area2D

@onready var player = %Player

func _on_body_entered(_body):
	player.slippery = true

func _on_body_exited(_body):
	player.slippery = false
