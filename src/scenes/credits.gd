extends Control

func _ready() -> void:
	$Container/FinalScore.text = String(globals.calculate_score())
	$Container/FinalClicks.text = String(globals.get_total_clicks())
	$Container/TotalSlowDown.text = String(globals.get_total_slow_down())


func _unhandled_key_input(event: InputEventKey) -> void:
	
	if event.is_action_pressed("exit"):
		get_tree().quit()
	
	if event.is_action_pressed("activate"):
		get_tree().change_scene("res://src/scenes/world-1.tscn")