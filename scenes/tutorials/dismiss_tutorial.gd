extends Control

@onready var tutorial: Control = $"."

func _ready() -> void:
	get_tree().paused = true

func _on_ok_button_pressed() -> void:
	get_tree().paused = false
	tutorial.queue_free()
