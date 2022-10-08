extends Control

signal scene_changed

func _on_Button_pressed():
	emit_signal("scene_changed")
