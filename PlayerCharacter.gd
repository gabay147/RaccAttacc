extends KinematicBody2D


# physics variables
var vel : Vector2 = Vector2()
var jumpforce : int = 600
var gravity : int = 800
const speed : int = 200
var facingDir : int = 1



# physics
func _physics_process(delta):
	
	vel.x = 0
	
		# movement inputs
	if Input.is_action_pressed("A"):
		vel.x -= speed
	if Input.is_action_pressed("D"):
		vel.x += speed
		
	
	# applying the velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	# gravity
	vel.y += gravity * delta
	
	# jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpforce
