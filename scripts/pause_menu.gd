extends Control

@onready var pause_animation: AnimationPlayer = $CanvasLayer/PauseAnimation
@onready var canvas_layer: CanvasLayer = $CanvasLayer


func resume():
	pause_animation.play_backwards("blur")
	canvas_layer.hide()
	get_tree().paused = false
	
	
func pause():
	canvas_layer.show()
	get_tree().paused = true
	pause_animation.play("blur")


func _on_resume_button_pressed() -> void:
	resume()

func _on_restart_button_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_main_menu_button_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://menus/main_menu.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	# This feels like a hack, I think I should be using a button here...
	pause()
