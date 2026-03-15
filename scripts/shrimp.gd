extends Sprite2D

@export var stats : shrimp_stats

signal ate_waste(money, position)

# global tank size
var x_min = 80+15
var x_max = 845-15
var y_min = 147+15
var y_max = 570-15

var _target:Vector2
var _direction:Vector2

var speed : int

var dashing = false
var dash_timer = 0.0
const dash_duration = 3.0

var money : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# initialise resources stats (WIP)
	money = stats.money
	texture = stats.texture
	_pick_new_target()

func _has_reached_target():
	const MIN_DISTANCE = 8.0 # Change this to suit your needs
	var d = _target.distance_to(global_position)
	return d < MIN_DISTANCE

func _pick_new_target():
	reset_speed()
	_target.x = randf_range(x_min, x_max) # Adjust these to your liking
	_target.y = randf_range(y_min, y_max)
	_direction = global_position.direction_to(_target)

func reset_speed():
	speed = 30

func _process(delta):

	if dashing:
		dash_timer += delta
		if (dash_timer > dash_duration):
			dashing = false
		
	if (randi() % 5 == 1 && dashing == false):
		speed = speed*2
		dashing = true
		dash_timer = 0.0

	if _has_reached_target():
		_pick_new_target()

	var distance = speed * delta

	position += _direction * distance
	
func eat():
	emit_signal("ate_waste", money, self.global_position)


func _on_eat_timer_timeout() -> void:
	eat()
