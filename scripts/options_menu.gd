extends Control

var master_bus = AudioServer.get_bus_index("Master")

@onready var toggle_sound_label: Label = $VBoxContainer/ToogleSound/ToggleSoundLabel
@onready var toggle_sound_button: TextureButton = $VBoxContainer/ToogleSound/ToggleSoundButton

func _ready() -> void:
	if AudioServer.is_bus_mute(master_bus):
		toggle_sound_button.set_pressed_no_signal(true)
		toggle_sound_label.text = "Mute"
	else:
		toggle_sound_button.set_pressed_no_signal(false)
		toggle_sound_label.text = "Sound on"

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/main_menu.tscn")


func _on_toggle_sound_pressed() -> void:
	if AudioServer.is_bus_mute(master_bus):
		toggle_sound_label.text = "Sound on"
		AudioServer.set_bus_mute(master_bus, false)
	else:
		toggle_sound_label.text = "Mute"
		AudioServer.set_bus_mute(master_bus, true)
