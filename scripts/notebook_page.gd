extends Node2D

signal spawn_pressed(entity)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for slot in self.get_children():
		slot.connect("spawn_pressed", _on_spawn_pressed)
		
func _on_spawn_pressed(entity):
	emit_signal("spawn_pressed", entity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
