extends Control

@export var value : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = 10.0
	%Value.text = str(value)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
