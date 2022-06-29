extends KinematicBody2D

const SPEED = 10
const GRAVITY = 20
const JUMP_POWER = 350
var UP_VECTOR = Vector2(0,-1)
var movement = Vector2(SPEED, 0)
var is_alive = true

onready var sprite = $Sprite

func _ready():
	pass
	
func _physics_process(delta):
	if is_alive == false:
		return
		
	movement.y += GRAVITY
	
	
	if is_on_floor():
		movement.y = 0
	
	move_and_slide_with_snap(movement, Vector2(0,1), UP_VECTOR)
	
	if is_on_wall():
		movement.x *= -1
		sprite.flip_h = sprite.flip_h == false

func _on_Tophit_body_entered(body):
	is_alive = false
	if body.name == "Player":
		queue_free()


func _on_Sidehit_body_entered(body):
	if body.name == "Player":
		body.player_die()
