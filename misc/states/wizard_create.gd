extends "res://misc/states/EnemyIdle.gd"

var animated_sprite = null

func Enter():
	animated_sprite = get_parent().get_parent().get_node("wizard_animated")
	make_skeleton()	
	
func make_skeleton():
	pass
	
func Physics_Update(delta: float):
	animated_sprite.play("spell_left")
	
	
