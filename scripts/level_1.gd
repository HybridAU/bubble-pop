extends Node
var bubble = preload("res://scenes/bubble.tscn")

@onready var label: Label = $"../ScoreLabel"
var score = 0


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
	new_bubble.popped.connect(add_point)
	add_child(new_bubble)
	
func add_point():
	score += 1
	label.text = "{score}/100".format({"score": score})
	if score >= 10:
		get_tree().change_scene_to_file("res://levels/level_2.tscn")
