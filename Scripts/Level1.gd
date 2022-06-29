extends Node2D

onready var finish = $FinishArea


func _ready():
	playerdead()
	
func playerdead():
	for body in finish.get_overlapping_bodies():
		if body.name == "Player" :
			get_tree().change_scene("res://Scenes/GameOverScreen.tscn")
		
	
