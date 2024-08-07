extends Sprite2D

@onready var sword_texture = preload("res://assets/sword.png")
@onready var bow_texture = preload("res://assets/bow.png")

@export var active_item: String = "sword"
# Called when the node enters the scene tree for the first time.
func _ready(): 
	set_texture(sword_texture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("change_weapon"):
		if active_item == "sword":
			set_texture(bow_texture)
			active_item = "bow"
		else:
			set_texture(sword_texture)
			active_item = "sword"
