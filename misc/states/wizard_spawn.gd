extends "res://misc/states/EnemyIdle.gd"

var animated_sprite = null

func Enter():
	animated_sprite = get_parent().get_parent().get_node("animated_sprite")
	
func Physics_Update(delta: float):
	if animated_sprite.is_playing() == false && animated_sprite.animation == "expose":
		Transitioned.emit(self, "wizardcreate")
	
