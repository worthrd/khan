extends "res://scripts/enemy.gd"



func _on_hurtbox_area_entered(area):
	print("enemy got hit!")
	if area.name == "Hitbox":
		healthbar.health  -= area.hurt_val
		if healthbar.health <= 0:
			die()


func _on_animated_sprite_animation_finished() -> void:
	if $animated_sprite.animation == "die":
		queue_free()
