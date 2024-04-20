extends FiniteStateMachine


func _init() -> void:
	_add_state("hot")
	
	
func _ready() -> void:
	set_state(states.hot)
	
	
func _state_logic(_delta: float) -> void:
	if state == states.hot:
		pass
		
		
func _get_transition() -> int:
	return -1
	
	
func _enter_state(_previous_state: int, new_state: int) -> void:
	match new_state:
		states.hot:
			animation_player.play("hot")
