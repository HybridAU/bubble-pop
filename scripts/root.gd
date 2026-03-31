extends Node2D
var bubble = preload("res://bubble.tscn")

# Touch point
var touch_point = preload("res://touch_point.tscn")
var live_touch_point = touch_point.instantiate()
var touch_position = 0

@onready var timer = $BubbleSpawnTimer

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
	new_bubble.position = Vector2(randf_range(100, get_viewport().size.x - 100), get_viewport().size.y - 100)
	add_child(new_bubble)
