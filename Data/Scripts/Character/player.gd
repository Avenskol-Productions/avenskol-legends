extends CharacterBody2D

var input
@export var speed = 100.0
@export var gravity = 10
var  jump_count = 0
@export var max_jump = 2
@export var jump_force = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement(delta)

func movement(delta):
	input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left") 
	if input != 0:
		if input > 0:
			velocity.x += speed * delta
			velocity.x = clamp(speed, 100.0, speed)
			$Sprite2D.scale.x = 1
			$Anim.play("Walk")
		if input < 0:
			velocity.x -= speed * delta
			velocity.x = clamp(-speed, 100.0, -speed)
			$Sprite2D.scale.x = -1
			$Anim.play("Walk")
	if input == 0:
		velocity.x = 0
		$Anim.play("Idle")
	if is_on_floor():
		if velocity.y < 0:
			$Anim.play("Jump")
	if velocity.y > 0:
		$Anim.play("Fall")
		#need to figure out how to regain the ability to jump after uses.
	if Input.is_action_just_pressed("jump") && is_on_floor() && jump_count < max_jump:
		#jump_count += 1
		velocity.y -= jump_force
		velocity.x = input
	#if !is_on_floor() && Input.is_action_just_pressed("Jump") && jump_count < max_jump:
		#jump_count += 1
		#velocity.y -= jump_force * 1.1
		#velocity.x = input
	if !is_on_floor() && Input.is_action_just_released("jump") && jump_count < max_jump:
		velocity.y = gravity
		velocity.x = input
	else:
		gravity_force()
	gravity_force()
	move_and_slide()

func gravity_force():
	velocity.y += gravity
