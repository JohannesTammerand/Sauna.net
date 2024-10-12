extends Node2D

@onready var pauseScreen = %PauseScreen

func _ready():
	get_tree().paused = false

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		pauseScreen.show()
