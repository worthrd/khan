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
	wizard_instance.position = get_random_point_in_polygon()
	add_child(wizard_instance)



func get_random_point_in_polygon() -> Vector2:
	
	var spawn_area = get_tree().get_first_node_in_group("spawn_collision_polygon")
	if spawn_area is CollisionPolygon2D:
		# Get the polygon points
		var points = spawn_area.polygon
		var random_point = Vector2.ZERO
		
		# Create a random point inside the polygon using the triangulation method
		var random_triangle = get_random_triangle(points)
		if random_triangle:
			random_point = get_random_point_in_triangle(random_triangle)
		
		return random_point
	return Vector2.ZERO

# Helper function to choose a random triangle from the polygon
func get_random_triangle(polygon_points: PackedVector2Array) -> Array:
	var num_points = polygon_points.size()
	if num_points < 3:
		return Array()
	
	# Choose a random triangle (this example assumes that the polygon is simple and convex)
	var idx1 = randi_range(0, num_points-1)
	var idx2 = (idx1 + randi_range(1, num_points-1)) % num_points
	var idx3 = (idx2 + randi_range(1, num_points-1)) % num_points
	
	return [polygon_points[idx1], polygon_points[idx2], polygon_points[idx3]]
	
# Helper function to get a random point inside a triangle
func get_random_point_in_triangle(triangle: Array) -> Vector2:
	var v0 = triangle[0]
	var v1 = triangle[1]
	var v2 = triangle[2]
	
	var r1 = randf()
	var r2 = randf()
	
	# Using the barycentric coordinates method to get a random point in the triangle
	if r1 + r2 > 1:
		r1 = 1 - r1
		r2 = 1 - r2
	
	var random_point = v0 + (v1 - v0) * r1 + (v2 - v0) * r2
	return random_point
