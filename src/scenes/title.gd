extends Control

func _unhandled_key_input(event: InputEventKey) -> void:
	
	if event.is_action_pressed("exit"):
		get_tree().quit()
	
	if event.is_action_pressed("activate"):
		get_tree().change_scene("res://src/scenes/world-1.tscn")