extends Node2D
@onready var bubble: Area2D = $Bubble
@onready var animation_player: AnimationPlayer = $AnimationPlayer


signal popped

func _ready() -> void:
	bubble.popped.connect(explode)

func explode():
	animation_player.play("explode")
	popped.emit()
