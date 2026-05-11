class_name MovementComponent extends Node

@export var body: CharacterBody2D
@export var speed: float = 300.0
@export var model: Sprite2D

var move_direction: Vector2 = Vector2.ZERO

func tick(delta: float) -> void:
	assert(body != null)
	
	body.velocity = move_direction * speed
	body.move_and_slide()
