extends RichTextLabel

var current_text = "SCORE: "

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = str(current_text, str(Global.current_score)) # Replace with function body.
