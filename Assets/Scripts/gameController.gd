extends Node2D

@onready var pauseScreen = %PauseScreen
@onready var hud = %HUD

func _ready():
	get_tree().paused = false

func _process(_delta):
	hud.show()
	if Input.is_action_just_pressed("pause"):
		hud.hide()
		get_tree().paused = true
		pauseScreen.show()
