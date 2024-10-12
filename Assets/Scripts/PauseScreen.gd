extends CanvasLayer
'''
func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		hide()
		get_tree().paused = false
'''

func _on_exit_button_pressed():
	get_tree().quit()

func _on_restart_button_pressed():
	get_tree().reload_current_scene()
	#get_tree().paused = false

func _on_resume_button_pressed():
	hide()
	get_tree().paused = false
