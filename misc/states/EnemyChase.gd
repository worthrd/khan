extends State
class_name EnemyFollow

@export var enemy: CharacterBody2D
@export var enemy_detection_area: Area2D
var animated_sprite  = null
var animation_player  = null
var healthbar = null


func Enter():
	self.player = context.previous_state.player
	animated_sprite = get_parent().get_parent().get_node("animated_sprite")
	animation_player = get_parent().get_parent().get_node("animation_player")
	healthbar = get_parent().get_parent().get_node("Healthbar")
	enemy_detection_area.area_exited.connect(_on_detection_area_body_exited)

func Update(delta: float):
	pass

func Physics_Update(delta: float):
	if  not healthbar.health <=0:
		var direction_vector = self.player.position - enemy.position
		var proposed = Helper.calculate_direction(direction_vector)
		
		var _distance = Helper.calculate_distance(direction_vector)
		if _distance < Helper.attack_distance: #enemy attack animation
			Transitioned.emit(self,"attack")
		else: 
			_play_walk_animation(proposed,delta)

func _on_detection_area_body_exited(body):
	var parent = body.get_parent()
	print("enemy detection area exited %s" % parent.name)
	if parent.name == "Player":
		Transitioned.emit(self, "idle")
	

func _play_walk_animation(proposed:String, delta:float):
	enemy.position+=((self.player.position - enemy.position)/Helper.enemy_speed)*delta
	if proposed == "left":
		animated_sprite.play("walk_left")
	elif  proposed == "right":
		animated_sprite.play("walk_right")
	elif  proposed == "up":
		animated_sprite.play("walk_back")
	elif  proposed == "down":
		animated_sprite.play("walk_front")
