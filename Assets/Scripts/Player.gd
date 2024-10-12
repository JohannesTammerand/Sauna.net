extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite2D

var lastDir = [0, 0]

func _physics_process(_delta):
	animated_sprite.flip_h = false
	
	var directionX = Input.get_axis("ui_left", "ui_right")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directionY = Input.get_axis("ui_up", "ui_down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if directionX > 0:
		animated_sprite.play("moveRight")
	elif directionX < 0:
		animated_sprite.play("moveRight")
		animated_sprite.flip_h = true
	elif directionY < 0:
		animated_sprite.play("moveUp")
	elif directionY > 0:
		animated_sprite.play("moveDown")
	elif lastDir[0] > 0:
		animated_sprite.play("idleRight")
	elif lastDir[0] < 0:
		animated_sprite.play("idleRight")
		animated_sprite.flip_h = true
	elif lastDir[1] < 0:
		animated_sprite.play("idleUp")
	elif lastDir[1] > 0:
		animated_sprite.play("idleDown")
	if directionX || directionY:
		lastDir = [directionX, directionY]

	move_and_slide()
