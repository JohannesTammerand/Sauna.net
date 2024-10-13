extends AnimatedSprite2D

func _on_area_2d_body_entered(_body):
	play("default")

func _on_area_2d_body_exited(_body):
	play_backwards("default")
