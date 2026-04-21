extends Control


# TODO programmatically add buttons based on number of levels unlocked.

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_3.tscn")

func _on_level_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_4.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scents/menus/main_menu.tscn")
