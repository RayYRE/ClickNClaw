extends Node2D

signal spawn(entity, num, cost)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ShrimpPage.connect("spawn_pressed", _on_spawn_pressed)
	$FishPage.connect("spawn_pressed", _on_spawn_pressed)
	$PlantPage.connect("spawn_pressed", _on_spawn_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_spawn_pressed(entity, num, cost) -> void:
	emit_signal(("spawn"), entity, num, cost) 

func _on_fish_button_pressed() -> void:
	$ShrimpPage.visible = false
	$PlantPage.visible = false
	$FishPage.visible = true


func _on_shrimp_button_pressed() -> void:
	$ShrimpPage.visible = true
	$PlantPage.visible = false
	$FishPage.visible = false


func _on_plant_button_pressed() -> void:
	$ShrimpPage.visible = false
	$PlantPage.visible = true
	$FishPage.visible = false


func _on_achievement_button_pressed() -> void:
	pass # Replace with function body.
