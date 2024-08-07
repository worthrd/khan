extends CharacterBody2D

@export var speed = 250
@onready var animated_sprite = $Animations
@export  var last_direction = "down"
@onready var healthbar = $Healthbar
@onready var animation = $AnimationPlayer
@export var inventory: Inventory

var bow_equipped = true
var bow_cooldown = true
var arrow = preload("res://scenes/arrow.tscn")

var health = 200

func _ready():
	healthbar.init_health(health)
	
	

func _physics_process(delta):
	var animation_name = animated_sprite.animation
	
	if animated_sprite.is_playing() and String(animation_name).begins_with("attack"): 
		return
	
	var x_axis = Input.get_axis("go_left", "go_right")
	var y_axis = Input.get_axis("go_up", "go_down")
	var input = Vector2(x_axis, y_axis)

	if Input.is_action_pressed("Attack"):
		if last_direction == "down":
			animated_sprite.play("attack_front")
			animation.play("attack_front")
		elif last_direction == "up":
			animated_sprite.play("attack_back")
			animation.play("attack_back")
		elif last_direction == "left":
			animated_sprite.play("attack_left")
			animation.play("attack_left")
		elif last_direction == "right":
			animated_sprite.play("attack_right")
			animation.play("attack_right")
	else:
		var velocity = Vector2.ZERO
		var animation_input = ""
		#position += input * speed * delta
		#print(last_direction)
		
		#move_and_slide()
		
		if input == Vector2(1,0):
			animation_input = "go_right"
			last_direction = "right"
			velocity.x += 1
		elif input == Vector2(-1,0):
			animation_input = "go_left"
			last_direction = "left"
			velocity.x += -1
		elif input == Vector2(0,-1):
			animation_input = "go_up"
			last_direction = "up"
			velocity.y -= 1
		elif input == Vector2(0,1):
			animation_input = "go_down"
			last_direction = "down"
			velocity.y += 1
		
		if velocity.length()>0:
			velocity = velocity.normalized() * speed
			animated_sprite.play(animation_input)
		
		position+=velocity * delta
		move_and_slide()
		
			
		if input == Vector2(0,0):
			if last_direction == "down":
				animated_sprite.play("idle_front")
			elif last_direction == "up":
				animated_sprite.play("idle_back")
			elif last_direction == "right":
				animated_sprite.play("idle_right")
			elif last_direction == "left":
				animated_sprite.play("idle_left")
				
		var mouse_pos = get_global_mouse_position()
		$MarkerArrow.look_at(mouse_pos)
		
		if Input.is_action_just_pressed("left_mouse") and bow_equipped and bow_cooldown and $active_item.active_item == "bow":
			
			bow_cooldown =false
			var arrow_instance = arrow.instantiate()
			arrow_instance.rotation = $MarkerArrow.rotation
			arrow_instance.global_position = $MarkerArrow.global_position
			add_child(arrow_instance)
			
			if last_direction == "down":
				animated_sprite.play("attack_bow_front")
			elif last_direction == "up":
				animated_sprite.play("attack_bow__back")
			elif last_direction == "left":
				animated_sprite.play("attack_bow_left")
			elif last_direction == "right":
				animated_sprite.play("attack_bow_right")
			
			await get_tree().create_timer(0.4).timeout
			bow_cooldown = true
	

func _on_hurtbox_area_entered(area):
	print("the player got hit!")
	print(healthbar.health)
	healthbar.health -= area.hurt_val
	
func collect(item):
	inventory.insert(item)
	
	
