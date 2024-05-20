extends CharacterBody2D

@export var walkSpeed = 150
@export var sprintSpeed = 200
@export var crouchSpeed = 75
@export var jumpForce = 255
@export var gravity = 900

@onready var animatedSprite = $AnimatedSprite2D


func _physics_process(delta):
	var direction = Input.get_axis("left","right")
	
	#Moving
	if direction:
		velocity.x = direction * walkSpeed
		
		#if is_on_floor():
			#animatedSprite.play("walk")
	else:
		velocity.x = 0
		
		#if is_on_floor():
			#animatedSprite.play("idle")
			
	#Rotating
	if direction == 1:
		animatedSprite.flip_h = false
	elif direction == 0:
		animatedSprite.flip_h = true
		
	#Falling
	if not is_on_floor():
		velocity.y += gravity * delta
		
		#if velocity.y > 0:
			#animatedSprite.play("fall")
			
	#Jumping
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y -= jumpForce
			#animatedSprite.play("jump")
