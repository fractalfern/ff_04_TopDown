extends CharacterBody2D

@export var speed: float = 300.0

var move_direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	move_direction = Input.get_vector("move_left", "move_right", 
									 "move_up", "move_down")
	
	self.velocity = move_direction * speed
	
	move_and_slide()
