extends CharacterBody2D

const ANIMATION_IDLE: String = "parameters/idle/blend_position"
const ANIMATION_MOVE: String = "parameters/move/blend_position"

@onready var input: InputComponent = %InputComponent
@onready var movement: MovementComponent = %MovementComponent
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback: AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")

func _ready() -> void:
	assert(animation_tree.get(ANIMATION_IDLE) != null)
	assert(animation_tree.get(ANIMATION_MOVE) != null)

func _physics_process(delta: float) -> void:
	input.update()
	movement.direction = input.vector
	
	if movement.direction != Vector2.ZERO:
		animation_tree.set(ANIMATION_IDLE, movement.direction)
		animation_tree.set(ANIMATION_MOVE, movement.direction)
	
	movement.tick(delta)

	
