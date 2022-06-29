extends Control


func _on_RestartButton_pressed() -> void:
	get_tree().change_scene("res://Scenes/Game.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
