extends RichTextLabel

@onready var player = %Player

func scroll_text():
	visible_characters = 0
	
	for c in get_parsed_text():
		visible_characters += 1
		await get_tree().create_timer(0.05).timeout
		if !visible:
			break
		if player.hand == "water" && player.heat > 800:
			player.heat = 100
			player.hand = "bucket"
	
	if visible && !AutoLoad.endingWater:
		AutoLoad.endingWater = true
		AutoLoad.endingsFound += 1
		get_tree().change_scene_to_file("res://Assets/Scenes/end_screen.tscn")

func _on_visibility_changed():
	scroll_text()
