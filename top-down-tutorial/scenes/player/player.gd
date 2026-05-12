extends CharacterBody2D

@onready var input: InputComponent = %InputComponent
@onready var movement: MovementComponent = %MovementComponent

func _physics_process(delta: float) -> void:
	input.update()
	movement.direction = input.vector
	movement.animate()
	movement.tick(delta)

	
