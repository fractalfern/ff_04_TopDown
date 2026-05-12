extends CharacterBody2D

@onready var input: InputComponent = %InputComponent
@onready var movement: MovementComponent = %MovementComponent
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback: AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")

func _physics_process(delta: float) -> void:
	input.update()
	movement.direction = input.vector
	
	if movement.direction != Vector2.ZERO:
		animation_tree.set("parameters/idle/blend_position", movement.direction)
		animation_tree.set("parameters/move/blend_position", movement.direction)
	
	movement.tick(delta)

	
