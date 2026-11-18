extends CharacterBody2D

	# Constants
const SPEED = 500.0
const JUMP_VELOCITY = -400.0

	# Collection
var collected_test_1 = false
var collected_test_2 = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

# handles rock 1
func _on_secret_1_body_entered(body: Node2D) -> void:
	if not collected_test_1:
		print("Yed it work")
		$"Index/Background/RockLabel1".color = Color(0.0, 0.706, 0.0, 1.0)
		
		collected_test_1 = true

# handles rock 2
func _on_secret_2_body_entered(body: Node2D) -> void:
	if not collected_test_2:
		print("Yed it work 2")
		$"Index/Background/RockLabel2".color = Color(0.0, 0.706, 0.0, 1.0)
		
		collected_test_2 = true



func _on_exit_pressed() -> void:
	$Index.hide()
	_on_button_toggled(true)


func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$Index.show()
	if not toggled_on:
		$Index.hide()
