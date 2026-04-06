extends Node

# Touch point
var touch_point = preload("res://scenes/touch_point.tscn")
var live_touch_point = null
var touch_position = Vector2(0,0)

func _ready() -> void:
	touch_position = Vector2(get_viewport().size.x / 2, get_viewport().size.y / 2)

func _input(event: InputEvent) -> void:
	touch_position=event.position
	if event is InputEventMouseButton:
		if event.is_pressed():
			live_touch_point = touch_point.instantiate()
			add_child(live_touch_point)
		else:
			live_touch_point.queue_free()
			remove_child(live_touch_point)

func _physics_process(delta: float) -> void:
	if live_touch_point:
		live_touch_point.global_position=touch_position
