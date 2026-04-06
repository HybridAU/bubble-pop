extends Node
var bubble = preload("res://scenes/bubble.tscn")
var bomb = preload("res://scenes/bomb.tscn")

# Touch point
var touch_point = preload("res://scenes/touch_point.tscn")
var live_touch_point = touch_point.instantiate()
var touch_position = Vector2(0,0)

@onready var label: Label = $ScoreLabel
var score = 0

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
	var weighting = randi_range(1, 10)
	var new_bubble
	if weighting == 10:
		new_bubble = bomb.instantiate()
		new_bubble.popped.connect(reset_points)
	else:
		new_bubble = bubble.instantiate()
		new_bubble.popped.connect(add_point)

	new_bubble.position = Vector2(
		# Left to right with a 100px margin
		randf_range(100, get_viewport().size.x - 100),
		# 100px margin at the bottom, and all the way up to half way up the screen
		randf_range(get_viewport().size.y - 100, get_viewport().size.y / 2)
	)
	add_child(new_bubble)

func reset_points():
	score = 0
	label.text = "{score}/100".format({"score": score})
	
func add_point():
	score += 1
	label.text = "{score}/100".format({"score": score})
	if score >= 100:
		print("TODO: Load level 2")
