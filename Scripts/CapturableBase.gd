extends Area2D

signal dead


func _on_FinishArea_body_entered(body: Node) -> void:
	emit_signal("dead")
	get_tree().change_scene("res://Scenes/GameOverScreen.tscn")
