extends Node2D

@export var entity : Resource

signal spawn_pressed(entity)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.texture = entity.texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	emit_signal("spawn_pressed", entity)
