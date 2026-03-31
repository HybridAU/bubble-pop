# https://www.youtube.com/watch?v=y8bi0_Fggn0
extends Line2D
class_name Trails

var queue: Array
@export var MAX_LENGTH: int


func _process(delta: float) -> void:
	var pos = get_parent().position
	queue.push_front(pos)
	
	if queue.size() > MAX_LENGTH:
		queue.pop_back()
	
	clear_points()
	
	for point in queue:
		add_point(point)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_released() or event.is_pressed():
			queue.clear()
