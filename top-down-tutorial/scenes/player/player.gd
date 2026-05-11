extends CharacterBody2D

@onready var input_component: InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent

func _physics_process(delta: float) -> void:
	input_component.update()
	
	movement_component.move_direction = input_component.input_direction
	movement_component.tick(delta)
