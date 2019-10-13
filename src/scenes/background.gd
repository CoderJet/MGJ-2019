extends CanvasLayer

func _ready() -> void:
	$TextureRect.modulate = globals.level_details[get_parent().level_no].level_colours[0]