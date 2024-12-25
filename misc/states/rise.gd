extends "res://misc/states/EnemyIdle.gd"


func Enter():
	var animated_sprite = get_tree().get_first_node_in_group("animated_sprite")
	animated_sprite.play("rise")
	enemy_detection_area.body_entered.connect(_on_detection_area_body_entered)
	


func _on_detection_area_body_entered(body):
	print("somebody is in skeleton !")
	self.player = body
	Transitioned.emit(self, "chase")
