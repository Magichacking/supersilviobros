extends KinematicBody2D


const SPEED = 100
const GRAVITY = 20
const JUMP_POWER = 350
var UP_VECTOR = Vector2(0,-1)
var movement = Vector2()


func _ready():
	$Player_animated.play("idle")
	
	
	
	
func _physics_process(delta):
	movement.x = 0
	
	movement.y += GRAVITY
	
	check_key_input()
	
	movement = move_and_slide(movement, UP_VECTOR)

	
	
func check_key_input():
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var jump = Input.is_action_just_pressed("jump")
	
	if right:
		movement.x =  SPEED
		$Player_animated.play("walk")
		$Player_animated.flip_h == false
	if left:
		movement.x =  -SPEED
		$Player_animated.play("walk")
		$Player_animated.flip_h == true
		
	if jump and is_on_floor():
		movement.y = -JUMP_POWER	
		$Player_animated.play("jump")
	if movement.x == 0:
		$Player_animated.play("idle")
	
		
func player_die():
	$Player_animated.play("die")
	
	
func check_for_hit():
	for body in $Hitbox.get_overlapping_bodies():
		if body.has_method("_on_Tophit_body_entered" ) and body.is_alive:
			body._on_Tophit_body_entered()
			movement.y = -JUMP_POWER * 0.8
		if body.has_method("_on_Sidehit_body_entered" ) and body.is_alive:
			body._on_Sidehit_body_entered()
			
			


