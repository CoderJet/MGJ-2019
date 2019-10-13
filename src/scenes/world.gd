extends Node2D

signal on_point_selected(pos)
signal on_activate_actions

onready var player := get_node("Player")
onready var caster : RayCast2D = get_node("RayCast")

export (int) var level_no = 1


var activated : bool = false
var player_can_move : bool = false

func _ready():
	if not $"/root/MusicPlayer".get_child(0).playing:
		$"/root/MusicPlayer".get_child(0).play()

func _process(delta: float) -> void:
	if activated:
		if globals.level_details[level_no].dead_eye_value < 0:
			trigger_dead_eye(false)
		else:
			globals.level_details[level_no].dead_eye_value -= delta


func _unhandled_input(event: InputEvent) -> void:
	if not player.alive:
		return
	
	if not event is InputEventMouseButton:
		if event.is_action_pressed("exit"):
			get_tree().quit()
		return

	if activated:
		if (event.button_index == BUTTON_LEFT and event.pressed):
			if player_can_move:
				emit_signal("on_point_selected", get_global_mouse_position())

	if event.button_index == BUTTON_RIGHT:
		if event.pressed and globals.level_details[level_no].dead_eye_value > 0:
			trigger_dead_eye(true)
		else:
			trigger_dead_eye(false)


func trigger_dead_eye(val : bool) -> void:
	activated = val
	Engine.time_scale = 0.05 if val else 1.0
	player.zoom(val)
	$Background/Shader.visible = val
	
	if not val:
		emit_signal("on_activate_actions")


func _on_World_mouse_entered() -> void:
	player_can_move = true


func _on_World_mouse_exited() -> void:
	player_can_move = false