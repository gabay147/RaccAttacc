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

# physics
func _physics_process(delta):
	
	print(get_floor_normal())
	
	vel.x = 0
	
	#Player State - Ground
	moveGround()
	
	#Player State - Ladder
	#moveLadder()
	
	#Player State - Shoot
	#moveShoot()
	
	
	# interact
	if Input.is_action_pressed("interact"):
		die()
	
	
	# applying the velocity
	vel = move_and_slide_with_snap(vel,(Vector2.DOWN * 0.2), Vector2.UP, true)
	
	# gravity
	vel.y += gravity * delta
	
	# jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpforce


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
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpforce
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

