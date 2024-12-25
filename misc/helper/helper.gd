class_name Helper

static var attack_distance = 100.0
static var enemy_speed = 2
static var health = 100

static func calculate_direction(direction_to_player:Vector2):
		var proposed_direction = ""
		
		if direction_to_player.y < 0: # enemy is at below
			if direction_to_player.x < 0: #enemy is at right
				if abs(direction_to_player.y) > abs(direction_to_player.x):
					proposed_direction = "up"
				else:
					proposed_direction = "left"
			elif direction_to_player.x > 0: #enemy is at left
				if abs(direction_to_player.y) > abs(direction_to_player.x):
					proposed_direction = "up"
				else:
					proposed_direction = "right"
		elif direction_to_player.y > 0: # enemy is at above
			if direction_to_player.x < 0: #enemy is at right
				if abs(direction_to_player.y) > abs(direction_to_player.x):
					proposed_direction = "down"
				else:
					proposed_direction = "left"
			elif direction_to_player.x > 0: #enemy is at left
				if abs(direction_to_player.y) > abs(direction_to_player.x):
					proposed_direction = "down"
				else:
					proposed_direction = "right"
			
		return proposed_direction


static func calculate_distance(direction_vector:Vector2):
	return sqrt(direction_vector.x ** 2  + direction_vector.y ** 2)
	

static func get_random_point_in_polygon(spawn_area: CollisionPolygon2D) -> Vector2:
	
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
static func get_random_triangle(polygon_points: PackedVector2Array) -> Array:
	var num_points = polygon_points.size()
	if num_points < 3:
		return Array()
	
	# Choose a random triangle (this example assumes that the polygon is simple and convex)
	var idx1 = randi_range(0, num_points-1)
	var idx2 = (idx1 + randi_range(1, num_points-1)) % num_points
	var idx3 = (idx2 + randi_range(1, num_points-1)) % num_points
	
	return [polygon_points[idx1], polygon_points[idx2], polygon_points[idx3]]
	
# Helper function to get a random point inside a triangle
static func get_random_point_in_triangle(triangle: Array) -> Vector2:
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
		
