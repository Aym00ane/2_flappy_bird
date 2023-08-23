extends CharacterBody2D

@export var gravity = 900.0
@export var jump_force = -300
@export var rotation_speed = 2

@onready var animation_player = $AnimationPlayer

var max_speed = 400
var is_started = false

func _ready():
	velocity = Vector2.ZERO
	animation_player.play("Idle")

func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		jump()
		if !is_started:
			animation_player.play("flap_wings")
			is_started=true
	
	if !is_started: 
		return
	velocity.y += gravity * delta
	velocity.y = min(velocity.y , max_speed)
		
	move_and_collide(velocity * delta)
		
	rotate_bird()

func jump():
	velocity.y = jump_force
	rotation = deg_to_rad(-30)

func rotate_bird():
	#rotate downwards when falling
	if velocity.y > 0 && rad_to_deg(rotation) < 90 :
		rotation += rotation_speed * deg_to_rad(1)
	#rotate backwards when jumping
	elif velocity.y < 0 && rad_to_deg(rotation) > -30 :
		rotation -= rotation_speed * deg_to_rad(1)
