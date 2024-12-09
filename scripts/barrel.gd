extends Node2D

@onready var animation = $AnimatedSprite2D
var arrow = preload("res://scenes/helper/arrow_collectable.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func crack():
	animation.play("crack")
	var rng = RandomNumberGenerator.new()
	var number = rng.randi_range(0,9)
	if number > 3:
		var arrow_instance = arrow.instantiate()
		arrow_instance.position = position
		add_child(arrow_instance)

func _on_area_2d_area_entered(area):
	if area.name == "Hitbox":
		crack()


func _on_animated_sprite_2d_animation_finished():
	#queue_free()
	pass
