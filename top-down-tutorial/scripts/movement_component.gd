class_name MovementComponent extends Node

@export var body: CharacterBody2D
@export var speed: float = 300.0

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	assert(body != null)

## Moves the CharacterBody2D by the current .direction and .speed
func tick(_delta: float) -> void:	
	body.velocity = direction * speed
	body.move_and_slide()
