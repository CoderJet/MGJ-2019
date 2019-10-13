extends Node

var score : int = 0

var game_colours = {
	0 : {},
	1 : {}
}

var level_details = {
		1 : Level.new(),
		2 : Level.new(),
		3 : Level.new(),
		4 : Level.new(),
		5 : Level.new(),
		6 : Level.new(),
		7 : Level.new(),
		8 : Level.new(),
		9 : Level.new(),
		10 : Level.new(),
		11 : Level.new(),
		12 : Level.new()
	}


func _generate_colours() -> void:
	game_colours[0] = {
		0 : Color("#97a97c"), # Background
		1 : Color("#f3f7cb"), # Walls
		2 : Color("#c6d29e"), # ??
		
		4 : Color("#346d70"), # Player Colour
		
		6 : Color("#3b2e3d"), # Enemy Colour
	}
	
	game_colours[1] = {
		0 : Color("#7dbff2"), # Background
		1 : Color("#8bc7d5"), # Walls
		2 : Color("#afc08a"), # ??
		
		4 : Color("#315364"), # Player Colour
		
		6 : Color("#33142a"), # Enemy Colour
	}


func _ready() -> void:
	_generate_colours()
	
	level_details[1].level_best = 2
	level_details[1].level_colours = game_colours[0]
	
	level_details[2].max_dead_eye = 0.3
	level_details[2].dead_eye_value = level_details[2].max_dead_eye
	level_details[2].level_best = 3
	level_details[2].level_colours = game_colours[0]
	
	level_details[3].max_dead_eye = 0.5
	level_details[3].dead_eye_value = level_details[3].max_dead_eye
	level_details[3].level_best = 7
	level_details[3].level_colours = game_colours[0]
	
	level_details[4].max_dead_eye = 0.5
	level_details[4].dead_eye_value = level_details[4].max_dead_eye
	level_details[4].level_best = 10
	level_details[4].level_colours = game_colours[0]
	
	level_details[5].max_dead_eye = 0.5
	level_details[5].dead_eye_value = level_details[5].max_dead_eye
	level_details[5].level_best = 2
	level_details[5].level_colours = game_colours[1]
	
	level_details[6].max_dead_eye = 0.5
	level_details[6].dead_eye_value = level_details[6].max_dead_eye
	level_details[6].level_best = 8
	level_details[6].level_colours = game_colours[1]
	
	level_details[7].max_dead_eye = 0.5
	level_details[7].dead_eye_value = level_details[7].max_dead_eye
	level_details[7].level_best = 100
	level_details[7].level_no = 7
	level_details[7].level_colours = game_colours[1]
	
	level_details[8].max_dead_eye = 0.5
	level_details[8].dead_eye_value = level_details[8].max_dead_eye
	level_details[8].level_best = 100
	level_details[8].level_no = 8
	level_details[8].level_colours = game_colours[1]

	level_details[9].max_dead_eye = 0.5
	level_details[9].dead_eye_value = level_details[9].max_dead_eye
	level_details[9].level_best = 100
	level_details[9].level_no = 8
	level_details[9].level_colours = game_colours[1]

	level_details[10].max_dead_eye = 0.5
	level_details[10].dead_eye_value = level_details[10].max_dead_eye
	level_details[10].level_best = 100
	level_details[10].level_no = 8
	level_details[10].level_colours = game_colours[1]

	level_details[11].max_dead_eye = 0.5
	level_details[11].dead_eye_value = level_details[11].max_dead_eye
	level_details[11].level_best = 100
	level_details[11].level_no = 8
	level_details[11].level_colours = game_colours[1]

	level_details[12].max_dead_eye = 0.5
	level_details[12].dead_eye_value = level_details[12].max_dead_eye
	level_details[12].level_best = 100
	level_details[12].level_no = 8
	level_details[12].level_colours = game_colours[1]