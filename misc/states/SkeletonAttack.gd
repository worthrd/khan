extends State
class_name SkeletonAttack

@export var enemy: CharacterBody2D
var animated_sprite  = null
var animation_player  = null
var healthbar = null
var fire_cooldown = true
var fire = preload("res://scenes/fire.tscn")
var timer = null

func Enter():
	self.player = context.previous_state.player
	animated_sprite = get_parent().get_parent().get_node("animated_sprite")
	animation_player = get_parent().get_parent().get_node("animation_player")
	healthbar = get_parent().get_parent().get_node("Healthbar")
	timer = get_parent().get_parent().get_node("fire_timer")
	#timer.start()

func Physics_Update(delta: float):
	if  not healthbar.health <=0:
		var direction_vector = self.player.position - enemy.position		
		if fire_cooldown:
			timer.start()
			fire_cooldown =false
			var fire_instance = fire.instantiate()
			#arrow_instance.rotation = $MarkerArrow.rotation
			fire_instance.position = enemy.position
			add_child(fire_instance)
			print("fire fireball!")
		
		var _distance = Helper.calculate_distance(direction_vector)
		if _distance > Helper.get_attack_distance(enemy.attack_type):
			timer.stop()
			Transitioned.emit(self, "chase")


func _on_fire_timer_timeout() -> void:
	fire_cooldown = true
