extends State
class_name EnemyAttack

@export var enemy: CharacterBody2D
var animated_sprite  = null
var animation_player  = null
var healthbar = null

func Enter():
	self.player = context.previous_state.player
	animated_sprite = get_tree().get_first_node_in_group("animated_sprite")
	animation_player = get_tree().get_first_node_in_group("animation_player")
	healthbar = get_tree().get_first_node_in_group("healthbar")


func Physics_Update(delta: float):
	if  not healthbar.health <=0:
		var direction_vector = self.player.position - enemy.position
		var proposed = Helper.calculate_direction(direction_vector)
		
		_play_attack_animation(proposed)
		
		var _distance = Helper.calculate_distance(direction_vector)
		if _distance > Helper.attack_distance:
			Transitioned.emit(self, "chase")


func _play_attack_animation(proposed:String):
		if proposed == "left":
			animated_sprite.play("attack_left")
			animation_player.play("attack_left")
		elif  proposed == "right":
			animated_sprite.play("attack_right")
			animation_player.play("attack_right")
		elif  proposed == "up":
			animated_sprite.play("attack_back")
			animation_player.play("attack_back")
		elif  proposed == "down":
			animated_sprite.play("attack_front")
			animation_player.play("attack_front")
