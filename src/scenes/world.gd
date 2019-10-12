extends Node2D

signal on_point_selected(pos)
signal on_activate_actions

onready var player := get_node("Player")
onready var caster : RayCast2D = get_node("RayCast")


var activated : bool = false


func _unhandled_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return

	if activated and (event.button_index == BUTTON_LEFT and event.pressed):
		emit_signal("on_point_selected", get_global_mouse_position())


	if event.button_index == BUTTON_RIGHT:
		if event.pressed:
			activated = true
			Engine.time_scale = .05
		else:
			activated = false
			Engine.time_scale = 1
			emit_signal("on_activate_actions")