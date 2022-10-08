extends Node


func _ready():
	$GameWorld.connect("scene_changd", self, "handle_scene_changed")
	

func handle_scene_changed
