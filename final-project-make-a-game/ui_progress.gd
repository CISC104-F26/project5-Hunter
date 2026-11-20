extends Label

@onready var player = $"../.."
const total = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(player.collected) + "/" + str(total)
	
	# Hides UI upon collecting all rocks
	if player.collected == total:
		$"../Congratulations".show()
		$"../../Index".hide()
		$"../LineEdit".hide()
		$"../IndexButton".hide()
			
