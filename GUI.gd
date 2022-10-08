extends Control

signal scene_changed(scene_name)

export (String) var scene_name = "Scene"

func _on_Button_pressed():
	emit_signal("scene_changed", scene_name)
