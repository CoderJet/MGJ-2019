extends Entity


func _physics_process(delta: float) -> void:
	position.y += .1 * Engine.time_scale
	
	if temp.size() > 0:
		position = position.linear_interpolate(temp[temp.size() - 1], 0.05 * Engine.time_scale)
		
		if position.distance_to(temp[temp.size() - 1]) < 20:
			temp.remove(temp.size() - 1)


func get_direction() -> Vector2:	
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0
	)


func calculate_move_velocity(
		linear_velocity 	: Vector2,
		direction 			: Vector2,
		speed 				: Vector2
	) -> Vector2:
	var out := linear_velocity
	
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	return out

var temp := PoolVector2Array()

func process_dead_eye(val : PoolVector2Array) -> void:	
	temp = val
