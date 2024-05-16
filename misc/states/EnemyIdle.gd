extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D
@export var enemy_detection_area: Area2D


	
func Enter():
	var animated_sprite = get_tree().get_first_node_in_group("animated_sprite")
	animated_sprite.play("idle_front")
	enemy_detection_area.body_entered.connect(_on_detection_area_body_entered)
	


func Update(delta: float):
	pass
		

func Physics_Update(delta: float):
	pass

	
func _on_detection_area_body_entered(body):
	print("somebody is in !")
	self.player = body
	Transitioned.emit(self, "chase")
	
	
	
	
