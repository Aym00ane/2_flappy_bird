extends Node2D

signal bird_crashed

@export var speed = -150

@onready var sprite1 = $ground1/Sprite2D
@onready var sprite2 = $ground2/Sprite2D

func _ready():
	sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()


func _process(delta):
	sprite1.global_position.x += delta * speed
	sprite2.global_position.x += delta * speed
	
	if sprite1.global_position.x < -sprite1.texture.get_width() :
		sprite1.global_position.x = sprite2.global_position.x + sprite1.texture.get_width()
	if sprite2.global_position.x < -sprite2.texture.get_width() :
		sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()


func _on_body_entered(body):
	bird_crashed.emit()
	stop()
	(body as Bird).stop()
func stop():
	speed = 0
