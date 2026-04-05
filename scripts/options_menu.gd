extends Control

var master_bus = AudioServer.get_bus_index("Master")
@onready var toggle_sound_label: Label = $VBoxContainer/ToogleSound/ToggleSoundLabel

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/main_menu.tscn")


func _on_toggle_sound_pressed() -> void:
	if AudioServer.is_bus_mute(master_bus):
		toggle_sound_label.text = "Sound on"
		AudioServer.set_bus_mute(master_bus, false)
	else:
		toggle_sound_label.text = "Mute"
		AudioServer.set_bus_mute(master_bus, true)
