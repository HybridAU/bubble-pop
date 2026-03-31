extends Node2D

var _rotation = randf_range(0.0, TAU)
var _speed = randi_range(200, 300)
var _scale = randf_range(0.1, 0.2)
var _lifetime = randf_range(0.3, 1.2)


func _ready() -> void:
	scale = Vector2(_scale, _scale)
	rotation = _rotation
	$Lifetime.wait_time = _lifetime
	$Lifetime.start()


func _process(delta: float) -> void:
	position = position + Vector2(0, _speed * delta).rotated(_rotation)


func _on_lifetime_timeout() -> void:
	queue_free()
