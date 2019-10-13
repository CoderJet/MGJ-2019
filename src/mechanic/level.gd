extends Node
class_name Level

var level_no : int = 1
var max_dead_eye : float = 0.4
var dead_eye_value : float = 0.4
var score : int = 0
var level_best : int = 0
var level_colours = {}


func reset_dead_eye() -> void:
	dead_eye_value = max_dead_eye