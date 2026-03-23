extends Area2D

var vertical_speed = 60
var horizonatal_speed = 0

@onready var timer = $Timer

func _ready() -> void:
	_on_timer_timeout()

func _on_timer_timeout():
	vertical_speed += randi_range(-10, 30)
	horizonatal_speed = randi_range(-20, 20)
	timer.wait_time = randf_range(0.5, 1.5)
	timer.start()


func _process(delta: float) -> void:
	position.y -= vertical_speed * delta
	position.x += horizonatal_speed * delta


func _input_event(viewport, event, shape_idx):
	# Detect if screen is touched or mouse is clicked
	if event is InputEventMouseButton or event is InputEventScreenTouch:
		if event.pressed:
			queue_free()
			print("Sprite tapped!")
			# Add tap logic here
