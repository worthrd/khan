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
		
