extends CharacterBody2D


const SPEED = 5.0
const GRAVITY = 100


func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity.y = GRAVITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := randi() % 2
	if (direction > 1):
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
