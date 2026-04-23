extends Node
var bubble = preload("res://scenes/bubbles/bubble.tscn")
var bomb = preload("res://scenes/bubbles/bomb.tscn")
var freeze = preload("res://scenes/bubbles/freeze.tscn")
var tutorial = preload("res://scenes/tutorials/level_3_tutorial.tscn")

@onready var label: Label = $"../ScoreLabel"

var score = 0

func _ready() -> void:
	# If we haven't already passed level 3, show the tutorial
	if Global.levels_unlocked < 4:
		var tutorial = tutorial.instantiate()
		add_child(tutorial)

func _on_bubble_spawn_timer_timeout() -> void:
	spawn_bubble()

func spawn_bubble() -> void:
	var weighting = randi_range(1, 10)
	var new_bubble
	if weighting == 10:
		new_bubble = bomb.instantiate()
	elif weighting == 9:
		new_bubble = freeze.instantiate()
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

	
func add_point():
	score += 1
	label.text = "{score}/1000".format({"score": score})
	if score >= 1000:
		Global.levels_unlocked = 4
		Global.save_settings()
		get_tree().change_scene_to_file("res://scenes/levels/level_4.tscn")
