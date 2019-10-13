extends Area2D


signal dissolve_player(scene, pos)


export (String, FILE) var scene_to_load


func _on_SceneExit_body_entered(body: PhysicsBody2D) -> void:
	emit_signal("dissolve_player", scene_to_load, position)