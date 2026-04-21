class_name Bubble

extends Area2D

@onready var pop_animation: AnimationPlayer = $PopAnimation
@onready var sprite: Sprite2D = $Sprite2D
@onready var timer = $Timer

signal popped

var vertical_speed = 60
var horizontal_speed = 0


func _ready() -> void:
	# TODO this isn't too bad with 7 textures, but there must be a way to glob these.
	# also, maybe the different bubbles can work differently, then we can use them for
	# specific things rather than just random.
	var bubble_1 = load("res://assets/bubbles/bubble_1.png")
	var bubble_2 = load("res://assets/bubbles/bubble_2.png")
	var bubble_3 = load("res://assets/bubbles/bubble_3.png")
	var bubble_4 = load("res://assets/bubbles/bubble_4.png")
	var bubble_5 = load("res://assets/bubbles/bubble_5.png")
	var bubble_6 = load("res://assets/bubbles/bubble_6.png")
	var bubble_7 = load("res://assets/bubbles/bubble_7.png")
	
	sprite.texture = [bubble_1, bubble_2, bubble_3, bubble_4, bubble_5, bubble_6, bubble_7].pick_random()
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
	popped.emit()
	pop_animation.play("pop_animation")

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	# Clear up bubbles that drift off the screen
	queue_free()
