class_name MovementComponent extends Node

@export var body: CharacterBody2D
@export var speed: float = 300.0

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	# I suppose I could see this being something you want to set in code,
	# but until then
	assert(body != null)

func tick(_delta: float) -> void:	
	body.velocity = direction * speed
	body.move_and_slide()
