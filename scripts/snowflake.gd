extends Node2D
@onready var bubble: Area2D = $Bubble
@onready var animation_player: AnimationPlayer = $AnimationPlayer


signal popped

func _ready() -> void:
	bubble.popped.connect(freeze)

func freeze():
	animation_player.play("freeze")
	popped.emit()
