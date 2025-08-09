extends CharacterBody2D

const SPEED := 130.0
const ACCELERATION := 5.0

func _physics_process(delta: float) -> void:
	# Godot 4 helper that gives a normalized 2D input vector.
	var input_vec := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")  # length <= 1
	# Smooth acceleration toward target speed
	velocity = velocity.lerp(input_vec * SPEED, ACCELERATION * delta)  # Vector2.lerp
	move_and_slide()  # uses the built-in 'velocity'

	# Face movement direction (angle() is radians). Subtract 90° if your art points up.
	if input_vec != Vector2.ZERO:
		$StackedSprite.rotation = velocity.angle() - PI/2
