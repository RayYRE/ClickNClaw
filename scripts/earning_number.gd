extends Node

@export var value : int
@export var position : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y += randf_range(-150, 0)
	display_number(self.value, position)
	

func display_number(value: int, position: Vector2):
	var number = Label.new()
	number.global_position = position
	number.text = str("$")
	number.z_index = 5
	number.label_settings = LabelSettings.new()
	
	var color = Color(0.467, 0.851, 0.071, 1.0)
	
	number.label_settings.font_color = color
	number.label_settings.font_size = 24
	number.label_settings.outline_color = Color(0, 0, 0)
	number.label_settings.outline_size = 2
	
	call_deferred("add_child",number)
	
	await number.resized
	number.pivot_offset = Vector2(number.size / 2)
	
	var tween = get_tree().create_tween()
	tween.set_parallel(false)
	tween.tween_property(
		number, "position:y", number.position.y - 48, 0.25
	).set_ease(Tween.EASE_OUT)
	tween.tween_property(
		number, "scale", Vector2.ZERO, 0.25
	)
	
	await tween.finished
	number.queue_free()
