extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1.0
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1.0
	#if Input.is_action_pressed( J U M P ):
	#	JUMP BEHAVIOR

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
