extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
		# 1. Natural gravity
		if not is_on_floor():
				velocity.y += gravity * delta

		# 2. Smooth jump
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
				velocity.y = JUMP_VELOCITY

		# 3. Read arrow inputs
		var direction = Input.get_axis("ui_left", "ui_right")
		var look_direction = Input.get_axis("ui_up", "ui_down")

		# 4. Straight, un-crashable horizontal movement
		if direction:
				velocity.x = direction * SPEED
		else:
				velocity.x = move_toward(velocity.x, 0, SPEED)

		# 5. Look up and down offset adjustments
		if look_direction < 0:
				$AnimatedSprite2D.position.y = -15.0
		elif look_direction > 0:
				$AnimatedSprite2D.position.y = 15.0
		else:
				$AnimatedSprite2D.position.y = 0.0

		# 6. Safe engine move command
		move_and_slide()
