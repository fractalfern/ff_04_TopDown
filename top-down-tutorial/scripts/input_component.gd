class_name InputComponent extends Node

var vector: Vector2 = Vector2.ZERO
var attack_pressed: bool = false

func update() -> void:
	vector = Input.get_vector("move_left", "move_right", 
							 "move_up", "move_down")
																		
	attack_pressed = Input.is_action_just_pressed("attack")
