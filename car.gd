extends CharacterBody2D

@export var speed: float = 300.0
@export var acceleration: float = 200.0
@export var friction: float = 150.0
@export var rotation_speed: float = 3.0

var current_speed: float = 0.0

func _physics_process(delta: float) -> void:
	var input_dir = 0.0

	if Input.is_action_pressed("ui_up"):
		current_speed = move_toward(current_speed, speed, acceleration * delta)
	elif Input.is_action_pressed("ui_down"):
		current_speed = move_toward(current_speed, -speed / 2, acceleration * delta)
	else:
		current_speed = move_toward(current_speed, 0, friction * delta)

	if current_speed != 0:
		if Input.is_action_pressed("ui_left"):
			input_dir = -1.0
		elif Input.is_action_pressed("ui_right"):
			input_dir = 1.0

	rotation += input_dir * rotation_speed * delta * sign(current_speed)

	velocity = Vector2(sin(rotation), -cos(rotation)) * current_speed

	move_and_slide()
