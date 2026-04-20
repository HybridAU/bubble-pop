extends Node2D
@onready var bubble: Area2D = $Bubble
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var freeze_body: Area2D = $Bubble/FreezeBody


signal popped

func _ready() -> void:
	bubble.popped.connect(freeze)

func _freeze_area(area: Area2D) -> void:
	"""
	Freeze an arbitrary area (probably bubbles, but in theory anything.)
	"""
	if "vertical_speed" in area and "horizontal_speed" in area and "timer" in area:
		area.vertical_speed = 0
		area.horizontal_speed = 0
		area.timer.stop()
		area.timer.wait_time = 3
		area.timer.start()

func freeze():
	bubble.vertical_speed = 0
	bubble.horizontal_speed = 0
	bubble.timer.stop()
	
	# Freeze all bubbles in the area
	var areas = freeze_body.get_overlapping_areas()
	for area in areas:
		_freeze_area(area)

	animation_player.play("freeze")
	popped.emit()


func _on_freeze_body_area_entered(area: Area2D) -> void:
	_freeze_area(area)
