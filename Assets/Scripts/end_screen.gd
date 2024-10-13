extends CanvasLayer

@onready var endings_count = $EndingsCount

func _ready():
	endings_count.text = str(AutoLoad.endingsFound)

func _on_quit_button_pressed():
	get_tree().quit()


func _on_resume_button_pressed():
	get_tree().change_scene_to_file("res://Assets/Scenes/main.tscn")
