extends Label

func _process(delta: float) -> void:
	if int(text) != globals.score:
		text = String(globals.score)