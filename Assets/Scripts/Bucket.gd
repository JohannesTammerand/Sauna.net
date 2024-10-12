extends Node2D

@onready var player = %Player
var interactable = false

func _process(_delta):
	if interactable  && Input.is_action_just_pressed("interact"):
		player.hand = "bucket"
		hide()

func _on_area_2d_body_entered(_body):
	interactable = true


func _on_area_2d_body_exited(_body):
	interactable = false
