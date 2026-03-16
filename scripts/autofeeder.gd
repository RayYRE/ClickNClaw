extends Node2D

var num = 4
signal feed(num)

signal upgrade_auto

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	emit_signal("feed", num)
	
func upgrade():
	$Timer.wait_time *= 0.5
	if $Timer.wait_time <= 0.5:
		num += 1

func _on_button_pressed() -> void:
	emit_signal("upgrade_auto")
