extends Control

@onready var level_1_tutorial: Control = $"."

func _ready() -> void:
	get_tree().paused = true

func _on_ok_button_pressed() -> void:
	get_tree().paused = false
	level_1_tutorial.queue_free()
