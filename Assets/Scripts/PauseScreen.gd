extends CanvasLayer

@onready var hints = $TextureRect/Hints

func _on_exit_button_pressed():
	get_tree().quit()

func _on_restart_button_pressed():
	get_tree().reload_current_scene()

func _on_resume_button_pressed():
	hide()
	get_tree().paused = false

func _on_hints_button_pressed():
	hints.show()

func _on_hints_exit_button_pressed():
	hints.hide()
