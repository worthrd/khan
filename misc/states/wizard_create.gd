extends "res://misc/states/EnemyIdle.gd"


var skeleton = preload("res://scenes/skeleton_enemy.tscn")
var animated_sprite = null

func Enter():
	animated_sprite = get_parent().get_parent().get_node("wizard_animated")
	make_skeleton()	
	
func make_skeleton():
	var skeleton_instance= skeleton.instantiate()
	var spawn_area = get_tree().get_first_node_in_group("spawn_collision_polygon")
	skeleton_instance.position = Helper.get_random_point_in_polygon(spawn_area)
	add_child(skeleton_instance)
	
func Physics_Update(delta: float):
	animated_sprite.play("spell_left")
	
	
