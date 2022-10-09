extends Node

var next_scene = null

onready var current_scene = $GUI

func _on_SceneSwitcher_ready():
	print($GUI)
	print(next_scene)
	current_scene.connect("scene_changed", self, "handle_scene_changed")
	

func handle_scene_changed(current_scene_name: String):
	var next_scene_name: String
	
	match current_scene_name:
		"gui":
			next_scene_name = "GameWorld"
		"gameworld":
			next_scene_name = "GUI"
		_:
			return
	
	next_scene = load("res://" + next_scene_name + ".tscn").instance()
	next_scene.layer = -1
	add_child(next_scene)
	next_scene.connect("scene_changed", self, "handle_scene_changed")
	current_scene.queue_free()
	current_scene = next_scene
	current_scene.layer = 1
	next_scene = null
	
	
	






