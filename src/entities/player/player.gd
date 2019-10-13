extends Entity

export var start_position := Vector2.ZERO

const MAX_ZOOM := Vector2(1.25, 1.25)
const MIN_ZOOM := Vector2(0.75, 0.75)

const MIN_DROP = 0.1
const MAX_DROP = 1.0
const DROP_STEP = 0.1
const DROP_DELAY = 0.25

var velocity = 0.0
var drop_rate = 0.0

var perform_zoom : bool = false
var zooming_out : bool = false
var dissolve : bool = false
var next_point := Vector2.ZERO
var alive : bool = true

var point_path := PoolVector2Array()

var scene_to_load := String()
var move_to : Vector2 = Vector2.ZERO


func _ready() -> void:
	$Sprite.modulate = globals.level_details[get_parent().level_no].level_colours[4]


func _physics_process(delta: float) -> void:
	if not alive:
		return

	if dissolve:
		position = position.linear_interpolate(move_to, delta)
		scale = scale.linear_interpolate(Vector2(0.1, 0.1), 0.025)
		
		if position.distance_to(move_to) < 5:
			dissolve = false
			get_tree().change_scene(scene_to_load)
	else:		
		if point_path.size() > 0:
			if next_point != point_path[point_path.size() - 1]:
				next_point = point_path[point_path.size() - 1]
				globals.level_details[get_parent().level_no].score += 1
			position = position.linear_interpolate(point_path[point_path.size() - 1], 0.05 * Engine.time_scale)
			
			if position.distance_to(point_path[point_path.size() - 1]) < 10:
				point_path.remove(point_path.size() - 1)
		else:
			if drop_rate >= DROP_DELAY:
				drop_rate = 0
				velocity += DROP_STEP
				velocity = clamp(velocity, MIN_DROP, MAX_DROP)
			drop_rate += delta
					
			position.y += velocity * Engine.time_scale
		
		if perform_zoom:
			if not zooming_out or $Camera2D.zoom == MAX_ZOOM:
				$Camera2D.zoom = $Camera2D.zoom.linear_interpolate(MIN_ZOOM, delta)
				
				if $Camera2D.zoom.distance_to(MIN_ZOOM) < 0.01:
					$Camera2D.zoom = MIN_ZOOM
					perform_zoom = false
			else:
				$Camera2D.zoom = $Camera2D.zoom.linear_interpolate(MAX_ZOOM, 0.05)
				
				if $Camera2D.zoom.distance_to(MAX_ZOOM) < 0.02:
					$Camera2D.zoom = MAX_ZOOM
					perform_zoom = false


func process_dead_eye(val : PoolVector2Array) -> void:
	point_path = val
	velocity = MIN_DROP


func zoom(val : bool) -> void:
	perform_zoom = true
	zooming_out = val


func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	# 'Died'
	$Shaker.start()
	alive = false
	visible = false
	globals.level_details[get_parent().level_no].reset_dead_eye()
	globals.level_details[get_parent().level_no].score = 0
	yield(get_tree().create_timer(1), "timeout")
	get_tree().reload_current_scene()

func _on_SceneExit_dissolve_player(scene, pos) -> void:
	dissolve = true
	point_path = PoolVector2Array()	
	move_to = pos
	scene_to_load = scene
	$Trail.visible = false