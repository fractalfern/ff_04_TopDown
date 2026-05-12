extends CharacterBody2D

@onready var input: InputComponent = %InputComponent
@onready var movement: MovementComponent = %MovementComponent
@onready var animation: AnimationComponent = %AnimationComponent

func _physics_process(delta: float) -> void:
	input.update()
	movement.direction = input.vector
	animation.animate()
	movement.tick(delta)
