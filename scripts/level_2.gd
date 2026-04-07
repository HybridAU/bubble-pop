extends Node
var bubble = preload("res://scenes/bubble.tscn")
var bomb = preload("res://scenes/bomb.tscn")
var level_2_tutorial = preload("res://scenes/level_2_tutorial.tscn")

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $"../ScoreLabel"

var score = 0

func _ready() -> void:
	# If we haven't already passed level 2, show the tutorial
	if Global.levels_unlocked < 3:
		var tutorial = level_2_tutorial.instantiate()
		add_child(tutorial)

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
	animation_player.play("flash_red")
	score = 0
	label.text = "{score}/100".format({"score": score})
	
	
func add_point():
	score += 1
	label.text = "{score}/100".format({"score": score})
	if score >= 100:
		Global.levels_unlocked = 3
		Global.save_settings()
		print("TODO: Build level 3")
