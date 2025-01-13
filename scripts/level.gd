extends Node2D

var arrow = preload("res://scenes/helper/arrow_collectable.tscn")
var wizard = preload("res://scenes/enemy_wizard.tscn")



func _ready():
	# pass
	# Uncomment when spawn logic is ready
	$item_spawn_timer.start()


func _on_item_spawn_timer_timeout():
	# spawn_arrow()
	spawn_wizard()


func spawn_arrow():
	var arrow_instance = arrow.instantiate()
	var player_pos = $Player.position
	
	var rand_x = randf_range(player_pos.x+50, player_pos.x + 200)
	var rand_y = randf_range(player_pos.y+50, player_pos.y + 200)
	
	var rand_position = Vector2(rand_x, rand_y)
	arrow_instance.position = rand_position
	
	add_child(arrow_instance)
	
	
func spawn_wizard():
	var wizard_instance= wizard.instantiate()
	var spawn_areas = get_tree().get_nodes_in_group("spawn_collision_polygon")
	var area_index = randi_range(0, spawn_areas.size()-1)
	
	#var spawn_area = get_tree().get_first_node_in_group("spawn_collision_polygon")
	#wizard_instance.position = Helper.get_random_point_in_polygon(spawn_area)
	wizard_instance.position = Helper.get_random_point_in_polygon(spawn_areas[area_index])
	add_child(wizard_instance)


func _on_win_area_area_entered(area: Area2D) -> void:
		get_tree().change_scene_to_file("res://scenes/game_win.tscn")
