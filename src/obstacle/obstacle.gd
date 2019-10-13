extends StaticBody2D

func _ready() -> void:
	$Sprite.modulate = globals.level_details[get_parent().get_parent().level_no].level_colours[1]