extends Area2D

const speed = 60
var direction = [-1, 0, 1].pick_random()


@onready var timer = $Timer


func _on_timer_timeout():
	direction = [-1, 0, 1].pick_random()
	timer.start()


func _process(delta: float) -> void:
	position.y -= speed * delta
	position.x += direction * 60 * delta
	



func _input_event(viewport, event, shape_idx):
	# Detect if screen is touched or mouse is clicked
	if event is InputEventMouseButton or event is InputEventScreenTouch:
		if event.pressed:
			direction = [-1, 0, 1].pick_random()
			print("Sprite tapped!")
			# Add tap logic here
