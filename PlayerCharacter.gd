extends KinematicBody2D




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
	
	vel.x = 0
	
	# movement inputs
	if Input.is_action_pressed("left"):
		vel.x -= speed
	if Input.is_action_pressed("right"):
		vel.x += speed
	
	
	# interact
	if Input.is_action_pressed("interact"):
		die()
	
	
	# applying the velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	# gravity
	vel.y += gravity * delta
	
	# jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpforce
	
	# sprite direction
	if vel.x < 0:
		sprite.flip_h = true
		facingDir = 1
	elif vel.x > 0:
		sprite.flip_h = false
		facingDir = -1


# called when you die
func die ():
	
		get_tree().reload_current_scene()

