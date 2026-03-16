extends Node2D

signal spawn_pressed(entity, num, cost)
var entity_cost : int 
var entity_count : int
@export var entity_page : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	entity_cost = 1
	$Coin/Label.text = str(entity_cost)
	$Coin2/Label.text = str(entity_cost * 2)
	$Coin4/Label.text = str(entity_cost * 5)
	$Coin3/Label.text = str(entity_cost * 10)
	
	for slot in self.get_children():
		slot.connect("spawn_pressed", _on_spawn_pressed)
		
func _on_spawn_pressed(entity, num, cost):
	emit_signal("spawn_pressed", entity, num, cost)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_count(count):
	entity_count = count
	entity_cost = max(entity_count / 10, 1)
	$Coin/Label.text = str(entity_cost)
	$Coin2/Label.text = str(entity_cost * 2)
	$Coin4/Label.text = str(entity_cost * 5)
	$Coin3/Label.text = str(entity_cost * 10)
