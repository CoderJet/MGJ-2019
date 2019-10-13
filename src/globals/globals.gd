extends Node

var score : int = 0

var level_details = {
		1 : Level.new(),
		2 : Level.new(),
		3 : Level.new(),
		4 : Level.new(),
		5 : Level.new(),
		6 : Level.new(),
		7 : Level.new(),
		8 : Level.new()
	}

func _ready() -> void:
	level_details[1].level_no = 1
	level_details[1].level_best = 2
	
	level_details[2].level_no = 2
	level_details[2].max_dead_eye = 0.3
	level_details[2].dead_eye_value = level_details[2].max_dead_eye
	level_details[2].level_best = 3
	
	level_details[3].level_no = 3
	level_details[3].max_dead_eye = 0.5
	level_details[3].dead_eye_value = level_details[3].max_dead_eye
	level_details[3].level_best = 7
	
	level_details[4].level_no = 4
	level_details[4].max_dead_eye = 0.5
	level_details[4].dead_eye_value = level_details[4].max_dead_eye
	level_details[4].level_best = 10
	
	level_details[5].level_no = 5
	level_details[5].max_dead_eye = 0.5
	level_details[5].dead_eye_value = level_details[5].max_dead_eye
	level_details[5].level_best = 2
	
	level_details[6].level_no = 6
	level_details[6].max_dead_eye = 0.5
	level_details[6].dead_eye_value = level_details[6].max_dead_eye
	level_details[6].level_best = 8
	
	level_details[7].level_no = 7
	level_details[7].max_dead_eye = 0.5
	level_details[7].dead_eye_value = level_details[7].max_dead_eye
	level_details[7].level_best = 100
	
	level_details[8].level_no = 8
	level_details[8].max_dead_eye = 0.5
	level_details[8].dead_eye_value = level_details[8].max_dead_eye
	level_details[8].level_best = 100