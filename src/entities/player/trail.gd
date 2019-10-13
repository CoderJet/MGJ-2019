extends Line2D


var point
onready var target = get_parent()
export var trail_length = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = Vector2(0, 0)
	global_rotation = 0
	
	point = target.global_position
	add_point(point)	
		
	while get_point_count() > trail_length:
		remove_point(0)