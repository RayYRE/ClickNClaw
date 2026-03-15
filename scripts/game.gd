extends Node2D

var money_count : int
var fish_count : int
var shrimp_count : int
var food_count : int
var plant_count : int
var waste_count : int

var fish_scene = load("res://scenes/fish.tscn")
var shrimp_scene = load("res://scenes/shrimp.tscn")
var plant_scene = load("res://scenes/plant.tscn")
var food_scene = load("res://scenes/food.tscn")
var earning_scene = load("res://scenes/earning.tscn")

var food_value : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Notebook.connect("spawn", _on_spawn_pressed)
	$FeedButton.connect("feed", _feed)
	$AutoFeeder.connect("feed", _feed)
	fish_count = 1
	shrimp_count = 1
	food_count = 0
	plant_count = 1
	waste_count = 0
	money_count = 0
	
	food_value = 1
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_period_timeout() -> void:
	print("fish   = ", fish_count)
	print("shrimp = ", shrimp_count)
	print("food   = ", food_count)
	print("plant  = ", plant_count)
	print("waste  = ", waste_count)
	print("money  = ", money_count)


func _on_spawn_pressed(entity) -> void:
	print("type :", entity.type)
	var instance
	if (entity.type == "plant"):
		instance = plant_scene.instantiate()
		plant_count += 1
	elif (entity.type == "fish"):
		instance = fish_scene.instantiate()
		fish_count += 1
	else:
		instance = shrimp_scene.instantiate()
		shrimp_count += 1

	instance.stats = entity
	instance.global_position = Vector2(300, 300)
	add_child(instance) 
	instance.connect("ate", _food_eaten)


func _food_eaten(money_multiplier, fish_position):
	if food_count > 0 :
		print("signal emitted")
		money_count += money_multiplier
		food_count -= 1
		
		var earning_instance
		earning_instance = earning_scene.instantiate()
		earning_instance.value = self.food_value
		earning_instance.position = fish_position
		add_child(earning_instance)


func _feed(num):
	var foodspawn_x_min = 85
	var foodspawn_x_max = 840
	var foodspawn_y = 100
	
	food_count += num
	for i in range(num):
		var foodspawn_x = (randi() % (foodspawn_x_max - foodspawn_x_min)) + 85
		var food_instance = food_scene.instantiate()
		food_instance.global_position = Vector2(foodspawn_x, foodspawn_y)
		add_child(food_instance)


func _on_eat_period_timeout() -> void:
	var food_ate = min(fish_count+shrimp_count, food_count) 
	var earnings = food_ate * food_value
	money_count += earnings
	food_count -= food_ate
	
