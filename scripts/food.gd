extends CharacterBody2D

const SPEED = 5.0
const GRAVITY = 100

var earning_scene = load("res://scenes/earning.tscn")

var value : int

func _process(delta: float) -> void:
	if global_position.y > 200:
		$FoodSprite.self_modulate.a *= 0.98
	
	if global_position.y > 400:
		var earning_instance
		earning_instance = earning_scene.instantiate()
		earning_instance.value = self.value
		earning_instance.position = global_position
		get_parent().add_child(earning_instance)
		queue_free()

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
