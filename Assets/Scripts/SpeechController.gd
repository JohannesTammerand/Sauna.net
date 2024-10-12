extends AnimatedSprite2D

var interactable = false;
@onready var text = %HUD.get_child(1)
@onready var player = %Player
@onready var area_2d = $Area2D

func _ready():
	text.text = get_meta("text")

func _process(_delta):
	if area_2d.has_overlapping_bodies():
		interactable = true
		
		if player.hand == "water" && Input.is_action_just_pressed("interact"):
			print("ded")
			pass
	
	if !area_2d.has_overlapping_bodies():
		if interactable:
			text.visible_characters = 0
			text.hide()
		interactable = false
	
	if interactable && Input.is_action_just_pressed("interact"):
		print("AAAAAAAAAAAAAA")
		text.show()
