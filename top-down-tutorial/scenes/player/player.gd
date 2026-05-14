extends CharacterBody2D

@onready var movement: MovementComponent = %MovementComponent
@onready var animation_tree: AnimationTree = $AnimationTree

var input_vector: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	input_vector = Input.get_vector("move_left", "move_right", 
							 "move_up", "move_down")

	if Input.is_action_just_pressed("attack"):
		attack()
		
	movement.direction = input_vector
	movement.animate(animation_tree)
	movement.move(self)
	
func attack() -> void:
	print("Is attacking")
