extends RichTextLabel

func scroll_text():
	visible_characters = 0
	
	for c in get_parsed_text():
		visible_characters += 1
		await get_tree().create_timer(0.05).timeout
		if !visible:
			break

func _on_visibility_changed():
	scroll_text()
