extends "res://misc/states/EnemyIdle.gd"


func Enter():
	pass

func _on_animated_sprite_2d_animation_finished() -> void:
	Transitioned.emit(self, "wizardcreate")
