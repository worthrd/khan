extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D

	
func Enter():
	var animated_sprite = get_tree().get_first_node_in_group("animated_sprite")
	animated_sprite.play("idle")

func Update(delta: float):
	pass
		

func Physics_Update(delta: float):
	pass


