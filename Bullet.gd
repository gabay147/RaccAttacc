extends Area2D



var speed : float = 30.0
var damage : int = 1

func _process(delta):
	#global_transform += global_transform.basis_xform(Vector2(1,0))
	#use move_and_collide




#func destroy ():
	#queue_free()
	



func _on_Bullet_body_entered(body):
	pass # Replace with function body.
