extends Node2D
var bubble = preload("res://bubble.tscn")
@onready var timer = $BubbleSpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bubble_spawn_timer_timeout() -> void:
	spawn_bubble()
	

func spawn_bubble() -> void:
	var new_bubble = bubble.instantiate()
	new_bubble.position = Vector2(randf_range(100, get_viewport().size.x - 100), get_viewport().size.y - 100)
	add_child(new_bubble)
