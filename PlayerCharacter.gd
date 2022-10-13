extends KinematicBody2D


# player state variables
onready var ladder_state = false
onready var attack_state = false

# sprites and animation variables
onready var sprite : Sprite = get_node("Sprite")
onready var anim = get_node("AnimatedSprite")

# physics variables
var vel : Vector2 = Vector2()
var jumpforce : int = 400
var gravity : int = 800
const speed : int = 200
var facingDir : int = 1
var rawInput : Vector2 = Vector2()

# physics
func _physics_process(delta):
	
	# 1) get player input
	# Build a vector2 (raw directional input data)
	# Switch states based on CONDITIONS
	#    - isGrounded (is touching the ground)
	#    - isJumping (spacebar pressed)
	#    - isFalling (spacebar pressed, !isGrounded) -Is this necessary?
	#    - isClimbing (interacted with ladder)
	#    - isShooting
	
	# 2) pass data into move()
	# check state thru match statement
	
	rawInput = Input.get_vector("left", "right", "down", "up")
	#vel.x = 0
	if Input.is_action_just_pressed("jump"):
		move(rawInput, 1, delta)
		vel.y += gravity * delta
	else:
		move(rawInput, 0, delta)
		vel.y += gravity * delta
		

	
	# interact
	if Input.is_action_pressed("interact"):
		die()
	
	#vel = 0
	#vel = move_and_
	
	# applying the velocity
	#vel = move_and_slide_with_snap(vel,(Vector2.DOWN * 0.2), Vector2.UP, true)
	
	
	# jump input
		

func move(PlayerInput: Vector2, state, delta):
	
	
	match state:
		# isGrounded
		0:
			vel = move_and_slide_with_snap(Vector2(PlayerInput.x, 0) * speed, (Vector2.DOWN * 0.2), Vector2.UP, true)
			
			
		# isJumping
		1:
			vel = move_and_slide_with_snap(Vector2(PlayerInput.x, 0) * speed, Vector2(0,0), Vector2.UP, true)
			print("isJump")
			vel.y -= jumpforce
			vel = vel.normalized()
		# isClimbing
		2:
			move_and_slide_with_snap(Vector2(0, PlayerInput.y), (Vector2.DOWN * 2))
			pass
			


func moveGround():
	
	
	# movement inputs
	if Input.is_action_pressed("left"):
		vel.x -= speed
		facingDir = 1
		print("left")
	if Input.is_action_pressed("right"):
		vel.x += speed
		facingDir = -1
		print("right")
	
	
	# jump input
	
  #Player should be able to...
  # 3) shoot

func moveLadder():
	pass
	
  #Get user input and move
  #Player should be able to...
  # 1) move up and down
  # 2) change facingDir (move left/right, will change sprite)
  # 3) jump off the ladder (jump input, movement behavior will be based on facingDir
  # Also include important variable tracking like facingDir

#func moveShoot():
  #Get user input (not sure what that will look like)
  #Player should be able to...
  # 1) Wait for cooldown? shoot more and launch self infinitely? Will need to play with this mechanic!



# called when you die
func die ():
	
		get_tree().reload_current_scene()

