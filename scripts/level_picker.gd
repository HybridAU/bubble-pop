extends Control



func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level_2.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/main_menu.tscn")
