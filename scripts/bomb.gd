extends Node2D
@onready var bubble: Area2D = $Bubble


signal popped

func _ready() -> void:
	bubble.popped.connect(send_popped)

func send_popped():
	popped.emit()
