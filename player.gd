extends KinematicBody2D


const SPEED = 100
const GRAVITY = 40
const JUMP_POWER = 150
var motion = Vector2(50,GRAVITY)

func _physics_process(delta):
	motion = move_and_slide(motion)

func _process(delta):
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var jump = Input.is_action_pressed("space")
	motion.y += GRAVITY
	
	if right:
		motion.x = 1 * SPEED
	if left:
		motion.x = 1* -SPEED
	if jump:
		motion.y = -JUMP_POWER	

func _ready():
	pass # Replace with function body.
