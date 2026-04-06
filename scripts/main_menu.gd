extends Control

func _on_start_game_pressed() -> void:
	if Global.levels_unlocked == 0:
		get_tree().change_scene_to_file("res://levels/level_1.tscn")
	else:
		get_tree().change_scene_to_file("res://menus/level_picker.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/options_menu.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
