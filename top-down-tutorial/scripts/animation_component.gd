## TODO: I think I want this inside of movement.
## That way when I have (for instance), an attack component, the
## attack animation goes with that
class_name AnimationComponent extends Node

const ANIMATION_IDLE: String = "parameters/idle/blend_position"
const ANIMATION_MOVE: String = "parameters/move/blend_position"

@export var movement: MovementComponent
@export var animation_tree: AnimationTree
@onready var playback: AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")

func _ready() -> void:
	assert(movement != null)
	assert(animation_tree != null)
	assert(animation_tree.get(ANIMATION_IDLE) != null)
	assert(animation_tree.get(ANIMATION_MOVE) != null)

func animate() -> void:
	# I made use of expressions in the AnimationTree, but that results 
	# in additional code duplication, so I should probably move that here
	if movement.direction != Vector2.ZERO:
		animation_tree.set(ANIMATION_IDLE, movement.direction)
		animation_tree.set(ANIMATION_MOVE, movement.direction)
