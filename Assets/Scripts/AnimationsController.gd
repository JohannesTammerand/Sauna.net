extends Node2D

@onready var wood_pickup_bot = $WoodPickupBot
@onready var furnace_bot = $FurnaceBot
@onready var window_area = $Window/WindowArea
@onready var window = $Window

func _ready():
	if AutoLoad.endingWindow:
		window.play("default")


func _process(_delta):
	if window_area.has_overlapping_bodies() && Input.is_action_just_pressed("interact") && !AutoLoad.endingWindow:
		window.play("default")
		await get_tree().create_timer(1).timeout
		AutoLoad.endingWindow = true
		AutoLoad.endingsFound += 1
		get_tree().change_scene_to_file("res://Assets/Scenes/end_screen.tscn")


func _on_wood_pickup_bot_animation_looped():
	furnace_bot.play("default")
