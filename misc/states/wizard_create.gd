extends "res://misc/states/EnemyIdle.gd"


var skeleton = preload("res://scenes/skeleton_enemy.tscn")
var animated_sprite = null
var timer = null 

func Enter():
	animated_sprite = get_parent().get_parent().get_node("animated_sprite")
	timer = get_parent().get_parent().get_node("enemy_create_timer")
	#timer.start()
	make_skeleton()	
	
func make_skeleton():
	var skeleton_instance= skeleton.instantiate()
	var spawn_area = get_tree().get_first_node_in_group("spawn_collision_polygon")
	skeleton_instance.position = Helper.get_random_point_in_polygon(spawn_area)
	add_child(skeleton_instance)
	
func Physics_Update(delta: float):
	if animated_sprite.animation !="die":
		animated_sprite.play("spell_left")
	
	


func _on_enemy_create_timer_timeout() -> void:
	make_skeleton()
