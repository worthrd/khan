extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text  = "YOU WIN!!!, YOUR SCORE: " + str(Global.current_score)
