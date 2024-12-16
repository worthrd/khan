extends Node2D

var arrow = preload("res://scenes/helper/arrow_collectable.tscn")
var wizard = preload("res://scenes/enemy_wizard.tscn")



func _ready():
	# pass
	# Uncomment when spawn logic is ready
	$item_spawn_timer.start()


func _on_item_spawn_timer_timeout():
	var arrow_instance = arrow.instantiate()
	
	var wizard = wizard.instantiate()
	
	var player_pos = $Player.position
	
	var rand_x = randf_range(player_pos.x+50, player_pos.x + 200)
	var rand_y = randf_range(player_pos.y+50, player_pos.y + 200)
	
	var rand_position = Vector2(rand_x, rand_y)
	arrow_instance.position = rand_position
	wizard.position = rand_position
	
	add_child(arrow_instance)
	add_child(wizard)
