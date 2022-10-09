extends CanvasLayer


signal scene_changed(scene_name)

export (String) var scene_name = "Scenes"



func _on_SceneButton_pressed() -> void:
	$SceneButton.disabled = true
	emit_signal("scene_changed", scene_name)
	print(scene_name)
