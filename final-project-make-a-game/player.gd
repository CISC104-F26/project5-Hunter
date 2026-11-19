extends CharacterBody2D

	# Constants
const SPEED = 600.0
@export var JUMP_VELOCITY = -1000.0

	# Collection
var collected_test_1 = false
var collected_test_2 = false

""" === Default player movement === """

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
	
""" === Rock Collecting Scripts Below === """

# Handles rock 1
func _on_secret_1_body_entered(body: Node2D) -> void:
	if not collected_test_1:
		print("Yed it work")
		$"Index/Background/RockLabel1".color = Color(0.0, 0.706, 0.0, 1.0)
		$"../RockFolder/Secret1/Rock1".hide()
		
		collected_test_1 = true

# Handles rock 2
func _on_secret_2_body_entered(body: Node2D) -> void:
	if not collected_test_2:
		print("Yed it work 2")
		$"Index/Background/RockLabel2".color = Color(0.0, 0.706, 0.0, 1.0)
		$"../RockFolder/Secret2/Rock2".hide()
		
		collected_test_2 = true


""" === Miscellaneous Functions Below === """

# Handles index button
func _on_index_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$Index.show()
	if not toggled_on:
		$Index.hide()

# Handles menu button
func _on_menu_button_pressed() -> void:
	$Menu.hide()

# Handles text codes
func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text == "Bingus":
		# $"../MeshInstance2D".modulate = Color(0.0, 0.543, 0.245, 1.0)
		position = Vector2(30,-30)
	elif new_text == "Dingus":
		$"../MeshInstance2D".modulate = Color(0.672, 0.574, 0.0, 1.0)
	else:
		$"../MeshInstance2D".modulate = Color(1.0, 0.28, 0.147, 1.0)
		await get_tree().create_timer(1.0).timeout
		$"../MeshInstance2D".modulate = Color(1.0, 1.0, 1.0, 1.0)
