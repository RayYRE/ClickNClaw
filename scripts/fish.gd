extends Sprite2D

@export var stats : fish_stats

signal ate(money_multiplier, fish_position)

# global tank size
var x_min = 80 + 50
var x_max = 845 - 50
var y_min = 147 + 25
var y_max = 570 - 25

var speed: float = 50.0
var velocity: Vector2

var dashing = false
var dash_timer = 0.0
const dash_duration = 3.0

var money_multiplier: float

func _ready() -> void:
	texture = stats.texture
	money_multiplier = stats.money_multiplier
	
	var angle = randf_range(0.0, TAU)
	velocity = Vector2(cos(angle), sin(angle)) * speed

func _process(delta):
	position += velocity * delta
	_bounce_off_walls()
	
func _bounce_off_walls():
	var bounced = false

	if global_position.x <= x_min:
		global_position.x = x_min
		velocity.x = abs(velocity.x)
		bounced = true
	elif global_position.x >= x_max:
		global_position.x = x_max
		velocity.x = -abs(velocity.x)
		bounced = true

	if global_position.y <= y_min:
		global_position.y = y_min
		velocity.y = abs(velocity.y)
		bounced = true
	elif global_position.y >= y_max:
		global_position.y = y_max
		velocity.y = -abs(velocity.y)
		bounced = true

	if bounced:
		velocity = velocity.normalized() * speed

func eat():
	emit_signal("ate", money_multiplier, self.global_position)


func _on_eat_period_timeout() -> void:
	eat()
