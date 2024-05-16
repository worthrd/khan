extends CharacterBody2D

@onready var healthbar = $Healthbar


func _ready():
	healthbar.init_health(Helper.health)

func _physics_process(delta):
	move_and_slide()

	
func _set_health(value):
	healthbar.health = Helper.health

func die():
	print("enemy is dying")
	$AnimatedSprite2D.play("die")
	#queue_free()


func _on_hurtbox_area_entered(area):
	print("enemy got hit!")
	if area.name == "Hitbox":
		healthbar.health  -= area.hurt_val
		if healthbar.health <= 0:
			die()


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "die":
		queue_free()
