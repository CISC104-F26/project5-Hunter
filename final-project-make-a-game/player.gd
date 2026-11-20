extends CharacterBody2D

	# Variables
var movement_enabled = false

	# Constants
const SPEED = 600.0
const JUMP_VELOCITY = -1000.0

	# Collection
var collected = 0
var collected_test_1 = false
var collected_test_2 = false

""" ===== Repeated Functions Below ===== Repeated Functions Below ===== Repeated Functions Below ===== """
func confirmation():
	$GameUi/LineEdit.modulate = Color(0.247, 0.765, 0.0, 1.0)
	await get_tree().create_timer(1).timeout
	$GameUi/LineEdit.modulate = Color(1.0, 1.0, 1.0, 1.0)	

""" ===== Default player movement ===== Default player movement ===== Default player movement ===== """
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and movement_enabled:
		velocity.y = JUMP_VELOCITY

	# Handle movement
	var direction := Input.get_axis("left", "right")
	if direction and movement_enabled:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
""" ===== Rock Collecting Scripts Below ===== Rock Collecting Scripts Below ===== Rock Collecting Scripts Below ===== """

# Handles rock 1
func _on_secret_1_body_entered(_body: Node2D) -> void:
	if not collected_test_1:
		print("Yed it work")
		$"Index/Background/RockLabel1".color = Color(0.0, 0.706, 0.0, 1.0)
		$"../RockFolder/Secret1/Rock1".hide()
		collected += 1
		
		collected_test_1 = true

# Handles rock 2
func _on_secret_2_body_entered(_body: Node2D) -> void:
	if not collected_test_2:
		print("Yed it work 2")
		$"Index/Background/RockLabel2".color = Color(0.0, 0.706, 0.0, 1.0)
		$"../RockFolder/Secret2/Rock2".hide()
		collected += 1
		
		collected_test_2 = true



""" ===== UI Functions Below ===== UI Functions Below ===== UI Functions Below ===== """
# Handles index button
func _on_index_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$Index.show()
		$GameUi/IndexButton/IndexButtonLabel.text = ("Close")
	if not toggled_on:
		$Index.hide()
		$GameUi/IndexButton/IndexButtonLabel.text = ("Rock-Dex")

# Handles menu button
func _on_menu_button_pressed() -> void:
	movement_enabled = true
	$Menu.hide()

""" ===== Text Code Functions Below ===== Text Code Functions Below ===== Text Code Functions Below ===== """

# Handles auto-reset, frozen player, case warning
func _on_line_edit_editing_toggled(toggled_on: bool) -> void:
	if toggled_on:
		movement_enabled = false
		$GameUi/LineEdit/CaseWarning.show()
	if not toggled_on:
		movement_enabled = true
		$GameUi/LineEdit.text = ("")
		$GameUi/LineEdit/CaseWarning.hide()

# Handles text answers
func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text == "Bingus":
		await confirmation()
		
		# Correct answer handling
		position = Vector2(30,-30)

	elif new_text == "Dingus":
		await confirmation()
		
		# Correct answer handling
		$"../MeshInstance2D".modulate = Color(0.672, 0.574, 0.0, 1.0)

	elif new_text == "Flamingus":
		await confirmation()
		
		# Correct answer handling
		$"../ImpassableWall/CollisionShape2D".disabled = true




	else:
		# Incorrect answer handling
		$GameUi/LineEdit.modulate = Color(1.0, 0.28, 0.147, 1.0)
		$GameUi/LineEdit.text = ("Incorrect...")
		await get_tree().create_timer(.5).timeout
		$GameUi/LineEdit.modulate = Color(1.0, 1.0, 1.0, 1.0)
		$GameUi/LineEdit.text = ("")
