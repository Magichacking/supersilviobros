extends Node2D

export(int) var level_number
export(String) var tube_name

onready var area = $Area2D

func _ready():
	pass

func _physics_process(delta):
	for body in area.get_overlapping_bodies():
		if body.name == "Player" and Input.is_action_just_pressed("down"):
			G.next_level_tube = tube_name
			G.next_level_number = level_number
			emit_signal("enter_tube")
			
