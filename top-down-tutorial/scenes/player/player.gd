extends CharacterBody2D

const ANIMATION_IDLE: String = "parameters/idle/blend_position"
const ANIMATION_MOVE: String = "parameters/move/blend_position"
const ANIMATION_ATTACK: String = "parameters/attack/blend_position"

@onready var animation_tree: AnimationTree = $AnimationTree
@export var speed: float = 300.0

var direction: Vector2 = Vector2.ZERO

enum State {IDLE, MOVE, ATTACK}
var state: State = State.IDLE

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", 
							 	   "move_up", "move_down")

	if Input.is_action_just_pressed("attack"):
		attack()
		
	if direction != Vector2.ZERO:
		animation_tree.set(ANIMATION_IDLE, direction)
		animation_tree.set(ANIMATION_MOVE, direction)
		animation_tree.set(ANIMATION_ATTACK, direction)
	
	self.velocity = direction * speed
	self.move_and_slide()
	
func attack() -> void:
	state = State.ATTACK
	print("Is attacking")
