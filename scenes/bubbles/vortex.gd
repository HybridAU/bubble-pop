extends Node2D

@onready var bubble: Area2D = $Bubble
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var vortex_area: Area2D = $Bubble/VortexArea


signal popped

func _ready() -> void:
	bubble.popped.connect(vortex)

func _vortex_area(area: Area2D) -> void:
	"""
	Pull bubble area into the center of the vortex
	"""
	if area is Bubble:
		var target_direction = vortex_area.global_position - area.global_position
		area.vertical_speed = -target_direction.y / 3
		area.horizontal_speed = target_direction.x / 3
		area.timer.stop()
		area.timer.wait_time = 3
		area.timer.start()


func vortex():
	bubble.vertical_speed = 0
	bubble.horizontal_speed = 0
	bubble.timer.stop()
	
	# Freeze all bubbles in the area
	var areas = vortex_area.get_overlapping_areas()
	for area in areas:
		_vortex_area(area)

	animation_player.play("vortex")
	popped.emit()


func _on_freeze_body_area_entered(area: Area2D) -> void:
	_vortex_area(area)
