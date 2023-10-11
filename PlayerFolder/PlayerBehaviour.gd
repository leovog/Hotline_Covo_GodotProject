extends CharacterBody2D


@export var SPEED = 300

@onready var animation_feet = $PlayerSpriteFeet
@onready var animation_head = $PlayerSpriteHead

func _physics_process(delta):
	
	look_at(get_global_mouse_position())
	
	
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	velocity = direction * SPEED
	
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right") or Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down"):
		animation_feet.play("Run")
		animation_feet.global_rotation = direction.angle()
		animation_head.play("HandgunMove")
	else:
		animation_feet.play("Idle")
		animation_head.play("HandgunIdle")
	
	
	
	move_and_slide()
