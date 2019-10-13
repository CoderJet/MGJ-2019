extends Entity

export (Array, Vector2) var travel_points
export var rotate_amount : int = 1

var path_itr : int = 1

func _ready() -> void:
	$Sprite.modulate = globals.level_details[get_parent().get_parent().level_no].level_colours[1]


func _physics_process(delta: float) -> void:
	rotation += rotate_amount * delta * Engine.time_scale
	
	if travel_points.size() > 0:
		position = position.linear_interpolate(travel_points[path_itr], speed * Engine.time_scale)
		
		if position.distance_to(travel_points[path_itr]) < 10:
			path_itr = (path_itr + 1) % travel_points.size()
