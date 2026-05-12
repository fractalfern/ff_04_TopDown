class_name MovementComponent extends Node

@export var body: CharacterBody2D
@export var speed: float = 300.0

var direction: Vector2 = Vector2.ZERO

func tick(_delta: float) -> void:
	assert(body != null)
	
	body.velocity = direction * speed
	body.move_and_slide()
