extends Area2D

@onready var player = %Player

func _process(_delta):
	if has_overlapping_bodies() && Input.is_action_just_pressed("interact") && player.hand == "bucket":
		print("water")
		player.hand = "water"
