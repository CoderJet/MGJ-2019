extends Node2D

onready var player := get_parent().get_node("Player")

var target_point := PoolVector2Array()

var is_running : bool = false


func _draw() -> void:	
	if is_running and target_point.size() > 0:
		for point in target_point:
			#var point = target_point
			draw_line(point - Vector2(5, 5), point + Vector2(5, 5), Color.red, 2.0)
		
			var new_pos_1 = point
			new_pos_1.x -= 5
			new_pos_1.y += 5
		
			var new_pos_2 = point
			new_pos_2.x += 5
			new_pos_2.y -= 5
		
			draw_line(new_pos_1, new_pos_2, Color.red, 2.0)

func _activate_dead_eye() -> void:
	target_point.invert()
	player.process_dead_eye(target_point)
	
	is_running = false
	target_point = PoolVector2Array()
	update()


func _on_World_on_point_selected(pos) -> void:
	target_point.push_back(pos)
	update()
	
	if not is_running:
		is_running = true


func _on_World_on_activate_actions() -> void:
	if is_running:
		_activate_dead_eye()
