extends Node

# Touch point
var touch_point = preload("res://scenes/touch_point.tscn")
var live_touch_point = null
var touch_position = null


func _input(event: InputEvent) -> void:
	touch_position=event.position
	if event is InputEventMouseButton:
		if event.is_pressed():
			# Clear out any previous touch point that may not have been previously cleared,
			# this can happen if we hit the pause button.
			if live_touch_point:
				live_touch_point.queue_free()

			live_touch_point = touch_point.instantiate()
			live_touch_point.global_position=touch_position
			add_child(live_touch_point)
		else:
			if live_touch_point:
				live_touch_point.queue_free()
				remove_child(live_touch_point)

func _physics_process(delta: float) -> void:
	if live_touch_point and touch_position:
		live_touch_point.global_position=touch_position
