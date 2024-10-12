extends AnimatedSprite2D

func _on_area_2d_body_entered(body):
	play("default")

func _on_area_2d_body_exited(body):
	play_backwards("default")
