extends Node

var next_scene = null

onready var current_scene = $GUI


func _ready() -> void:
	print($GUI)
	print($Scenes)
	current_scene.connect("scene_changed", self, "handle_scene_changed")
	

func handle_scene_changed(current_scene_name: String):
	var next_scene_name: String
	
	match current_scene_name:
		"GUI":
			next_scene_name = "GUI"
		"GameWorld":
			next_scene_name = "GameWorld"
		_:
			return
	
	next_scene = load("res://" + next_scene_name + "Scene.tscn").instance()
	add_child(next_scene)
	current_scene.queue_free()
	current_scene = next_scene


func _on_SceneSwitcher_ready():
	pass # Replace with function body.
