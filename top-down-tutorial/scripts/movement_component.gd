class_name MovementComponent extends Node

# TODO: move these global?
const ANIMATION_IDLE: String = "parameters/idle/blend_position"
const ANIMATION_MOVE: String = "parameters/move/blend_position"

@export var body: CharacterBody2D
@export var animation_tree: AnimationTree

@export var speed: float = 300.0

## Normalized direction vector
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	assert(body != null)
	assert(animation_tree != null)	
	assert(animation_tree.get(ANIMATION_IDLE) != null)
	assert(animation_tree.get(ANIMATION_MOVE) != null)

## Updates the underlying body's velocity
## using the current direction and speed
## The move_and_slide() the body
func tick(_delta: float) -> void:
	body.velocity = direction * speed
	body.move_and_slide()

## Animates the current movement
## Recommended to be called before tick()
func animate() -> void:
	if direction != Vector2.ZERO:
		animation_tree.set(ANIMATION_IDLE, direction)
		animation_tree.set(ANIMATION_MOVE, direction)
