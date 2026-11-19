
extends Camera2D

var camera_speed = 1000.0
var direction = Vector2(1,0)

var distance_traveled = 0.0
var max_distance_left = Vector2(-300,0)
var max_distance_right = Vector2(300,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../Menu".show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
"""func _process(delta: float) -> void:
	if distance_traveled >= max_distance_left.x:
			pass
	else:
		if Input.is_action_pressed("left"):
			position = position - direction * camera_speed * delta
			distance_traveled = distance_traveled + camera_speed * delta
			#print(position)
	
	if distance_traveled >= max_distance_right.x:
			pass
	else:
		if Input.is_action_pressed("right"):
			position = position + direction * camera_speed * delta
			distance_traveled = distance_traveled + camera_speed * delta
			print(position)
			"""
