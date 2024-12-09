extends Node
class_name StateMachine

@export var initial_state: State

var current_state: State
var states: Dictionary = {}
var previous_state: State


func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
			child.context = self
			
	
	if initial_state:
		initial_state.Enter()
		current_state = initial_state	
	
func _process(delta):
	if current_state:
		current_state.Update(delta)


func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)


func on_child_transition(state, new_state_name):
	print("transitioned happened from " + str(state) + " to " + str(new_state_name) )
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.Exit()
		previous_state = current_state
		
	new_state.Enter()
	
	current_state = new_state
