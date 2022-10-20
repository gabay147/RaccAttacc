extends Area2D



var speed : float = 30.0
var damage : int = 1

#func _process(delta):
#	translation += global_transform.basis.x * speed * delta




#func destroy ():
	#queue_free()
	



func _on_Bullet_body_entered(body):
	pass # Replace with function body.
