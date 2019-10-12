extends Entity

export (Array, Vector2) var travel_points

var path_itr : int = 1


func _physics_process(delta: float) -> void:
	if travel_points.size() > 0:
		position = position.linear_interpolate(travel_points[path_itr], 0.025 * Engine.time_scale)
		
		if position.distance_to(travel_points[path_itr]) < 10:
			path_itr = (path_itr + 1) % travel_points.size()
