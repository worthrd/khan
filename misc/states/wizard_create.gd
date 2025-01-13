extends "res://misc/states/EnemyIdle.gd"


var skeleton = preload("res://scenes/skeleton_enemy.tscn")
var red_helmet = preload("res://scenes/enemy.tscn")
var animated_sprite = null
var timer = null 

func Enter():
	animated_sprite = get_parent().get_parent().get_node("animated_sprite")
	timer = get_parent().get_parent().get_node("enemy_create_timer")
	timer.start()
	
func make_enemy():
	var rand_enemy = randi_range(0,1)
	if rand_enemy == 0:
		make_red_helmet()
	else:
		make_skeleton()

func make_red_helmet():
	var red_helmet_instance= red_helmet.instantiate()
	var spawn_areas = get_tree().get_nodes_in_group("spawn_collision_polygon")
	var area_index = randi_range(0, spawn_areas.size()-1)
	
	red_helmet_instance.position = Helper.get_random_point_in_polygon(spawn_areas[area_index])
	add_child(red_helmet_instance)
	
func make_skeleton():
	var skeleton_instance= skeleton.instantiate()
	var spawn_areas = get_tree().get_nodes_in_group("spawn_collision_polygon")
	var area_index = randi_range(0, spawn_areas.size()-1)
	
	skeleton_instance.position = Helper.get_random_point_in_polygon(spawn_areas[area_index])
	add_child(skeleton_instance)
	
func Physics_Update(delta: float):
	if animated_sprite.animation !="die":
		animated_sprite.play("spell_left")
	
	


func _on_enemy_create_timer_timeout() -> void:
	make_enemy()
