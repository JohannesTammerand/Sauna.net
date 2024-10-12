extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var HUD = %HUD
@onready var HealthBar = HUD.get_child(0)

var lastDir = [0, 0]
var heat = 0
var slippery = false

var directionX
var directionY

func _process(_delta):
	if heat == 1000:
		get_tree().reload_current_scene()

func _physics_process(delta):
	movement(delta)
	animation()
	HealthBar.value = heat

func movement(delta):
	directionX = Input.get_axis("ui_left", "ui_right")
	directionY = Input.get_axis("ui_up", "ui_down")
	if !slippery:
		if directionX:
			velocity.x = directionX * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		if directionY:
			velocity.y = directionY * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		if directionX:
			velocity.x = lerpf(velocity.x, SPEED*directionX, 2*delta)
		else:
			velocity.x = lerpf(velocity.x, SPEED*directionX, 1*delta)
		if directionY:
			velocity.y = lerpf(velocity.y, SPEED*directionY, 2*delta)
		else:
			velocity.y = lerpf(velocity.y, SPEED*directionY, 1*delta)
			
	move_and_slide()

func animation():
	animated_sprite.flip_h = false
			
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
