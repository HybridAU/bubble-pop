extends Area2D

@onready var pop_animation: AnimationPlayer = $PopAnimation


var vertical_speed = 60
var horizontal_speed = 0

@onready var timer = $Timer

func _ready() -> void:
	_on_timer_timeout()

func _on_timer_timeout():
	vertical_speed += randi_range(-10, 30)
	horizontal_speed = randi_range(-20, 20)
	timer.wait_time = randf_range(0.5, 1.5)
	timer.start()


func _physics_process(delta: float) -> void:
	position.y -= vertical_speed * delta
	position.x += horizontal_speed * delta


func _on_body_entered(body: Node2D) -> void:
	pop_animation.play("pop_animation")
