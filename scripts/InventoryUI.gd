extends Control


var is_open = false
@onready var inv:Inventory = preload("res://inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
# Called when the node enters the scene tree for the first time.
func _ready():
	inv.update.connect(update_slots)
	update_slots()
	close()
	
func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])

func _process(delta):
	
	if Input.is_action_just_pressed("inventory"):
		print("i pressed")
		if is_open:
			close()
		else: 
			open()

func open():
	visible = true
	is_open = true
	
	
func close():
	visible = false
	is_open = false

