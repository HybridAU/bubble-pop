extends Sprite2D

func _ready() -> void:
	# TODO this isn't too bad with 7 textures, but there must be a way to glob these.
	# also, maybe the diffrent bubbles can work differently, then we can use them for 
	# specific things rather than just random.
	var bubble_1 = load("res://assets/Bubbles/bubble_1.png")
	var bubble_2 = load("res://assets/Bubbles/bubble_2.png")
	var bubble_3 = load("res://assets/Bubbles/bubble_3.png")
	var bubble_4 = load("res://assets/Bubbles/bubble_4.png")
	var bubble_5 = load("res://assets/Bubbles/bubble_5.png")
	var bubble_6 = load("res://assets/Bubbles/bubble_6.png")
	var bubble_7 = load("res://assets/Bubbles/bubble_7.png")
	
	texture = [bubble_1, bubble_2, bubble_3, bubble_4, bubble_5, bubble_6, bubble_7].pick_random()
