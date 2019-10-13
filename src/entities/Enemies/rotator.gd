extends Entity

export (Array, Vector2) var travel_points
var path_itr : int = 1


func _physics_process(delta: float) -> void:
	rotation += 1 * delta
