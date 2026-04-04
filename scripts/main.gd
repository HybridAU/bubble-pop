extends Node
var bubble = preload("res://scenes/bubble.tscn")

# Touch point
var touch_point = preload("res://scenes/touch_point.tscn")
var live_touch_point = touch_point.instantiate()
var touch_position = Vector2(0,0)


func _ready() -> void:
	touch_position = Vector2(get_viewport().size.x / 2, get_viewport().size.y / 2)

func _input(event: InputEvent) -> void:
	touch_position=event.position
	if event is InputEventMouseButton:
		if event.is_pressed():
			add_child(live_touch_point)
		else:
			remove_child(live_touch_point)


func _physics_process(delta: float) -> void:
	live_touch_point.global_position=touch_position

func _on_bubble_spawn_timer_timeout() -> void:
	spawn_bubble()

func spawn_bubble() -> void:
	var new_bubble = bubble.instantiate()
	new_bubble.position = Vector2(
		# Left to right with a 100px margin
		randf_range(100, get_viewport().size.x - 100),
		# 100px margin at the bottom, and all the way up to half way up the screen
		randf_range(get_viewport().size.y - 100, get_viewport().size.y / 2)
	)
	add_child(new_bubble)
