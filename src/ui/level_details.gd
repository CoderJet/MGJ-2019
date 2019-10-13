extends VBoxContainer

export var level_best : int = 10

onready var level_val : Label = get_node("Level/Value")
onready var best_val : Label = get_node("ScoreToBeat/Value")
onready var score_val : Label = get_node("Score/Value")

onready var dead_eye_progress : TextureProgress = get_node("DeadEye/CenterContainer/Value")

var current_level : int = 0

func _ready() -> void:
	current_level = get_parent().get_parent().level_no
	level_best = globals.level_details[current_level].level_best
	print("Current Level: " + String(current_level))
	
	level_val.text = String(current_level)
	best_val.text = String(level_best)
	
	dead_eye_progress.min_value = 0
	dead_eye_progress.max_value = globals.level_details[current_level].max_dead_eye
	dead_eye_progress.value = dead_eye_progress.max_value
	
	print(dead_eye_progress.max_value)

func _process(delta: float) -> void:
	if int(score_val.text) != globals.level_details[current_level].score:
		score_val.text = String(globals.level_details[current_level].score)
	
	dead_eye_progress.value = globals.level_details[current_level].dead_eye_value