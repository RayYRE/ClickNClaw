extends Node2D

var fish_count : int
var shrimp_count : int
var food_count : int
var plant_count : int
var waste_count : int
var O2_count : int

var O2_rate : int
var waste_rate : int
var food_rate : int

var fish_scene = load("res://scenes/fish.tscn")
var shrimp_scene = load("res://scenes/shrimp.tscn")
var plant_scene = load("res://scenes/plant.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Notebook.connect("spawn", _on_spawn_pressed)
	fish_count = 0
	shrimp_count = 0
	food_count = 0
	plant_count = 0
	waste_count = 0
	O2_count = 0
	
	O2_rate = 0
	waste_rate = 0
	food_rate = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_period_timeout() -> void:
	for child in get_children():
		if child.name.substr(0, 4) == "Fish":
			fish_count += 1
			update_rate(child)
			
		elif child.name.substr(0, 5) == "Plant":
			fish_count += 1
			update_rate(child)
			
		elif child.name.substr(0, 6) == "Shrimp":
			shrimp_count += 1
			update_rate(child)
			
		
	# Calculate all the rate
	O2_count += O2_rate
	waste_count += waste_rate
	food_count += food_rate
	
	# Resets all the rate
	O2_rate = 0
	waste_rate = 0
	food_rate = 0
	
	if O2_count < 0:
		O2_count = 0
	if waste_count < 0:
		waste_count = 0

	print("fish   = ", fish_count)
	print("shrimp = ", shrimp_count)
	print("food   = ", food_count)
	print("plant  = ", plant_count)
	print("waste  = ", waste_count)
	print("O2     = ", O2_count)
	pass # Replace with function body.

func update_rate(child: Node2D)-> void :
	O2_rate += child.stats.oxygen
	waste_rate += child.stats.waste
	food_rate += randi_range(child.stats.foodmin, child.stats.foodmax)
	
func _on_spawn_pressed(entity) -> void:
	print("type :", entity.type)
	var instance
	if (entity.type == "plant"):
		instance = plant_scene.instantiate()
	elif (entity.type == "fish"):
		instance = fish_scene.instantiate()
	else:
		instance = shrimp_scene.instantiate()

	instance.stats = entity
	instance.global_position = Vector2(300, 300)
	add_child(instance) 
