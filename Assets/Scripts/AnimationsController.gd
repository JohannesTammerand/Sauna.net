extends Node2D

@onready var wood_pickup_bot = $WoodPickupBot
@onready var furnace_bot = $FurnaceBot

func _on_wood_pickup_bot_animation_looped():
	furnace_bot.play("default")
