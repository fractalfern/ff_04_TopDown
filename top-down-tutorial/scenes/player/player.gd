extends CharacterBody2D

const ANIMATION_IDLE: String = "parameters/idle/blend_position"
const ANIMATION_MOVE: String = "parameters/move/blend_position"
const ANIMATION_ATTACK: String = "parameters/attack/blend_position"

enum State {IDLE, MOVE, ATTACK}

@export var speed: float = 300.0

var state: State = State.IDLE
var facing_direction: Vector2 = Vector2.ZERO
var attack_speed: float = 0.4 #TODO link this to the animation

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var animation_playback: AnimationNodeStateMachinePlayback = $AnimationTree["parameters/playback"]


func _ready() -> void:
	animation_tree.active = true


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		if state != State.ATTACK:
			state = State.ATTACK
			set_velocity(Vector2.ZERO)
		
			await get_tree().create_timer(attack_speed).timeout
			state = State.IDLE
	
	if state != State.ATTACK:
		var input_vector: Vector2 = Input.get_vector("move_left", "move_right", 
											 		"move_up", "move_down")

		var motion: Vector2 = input_vector*speed
		
		if motion != Vector2.ZERO:
			facing_direction = input_vector
			
			if state == State.IDLE:
				state = State.MOVE
		elif motion == Vector2.ZERO and state == State.MOVE:
			state = State.IDLE
			
		set_velocity(motion)
	
	match state:
		State.IDLE:
			animation_tree.set(ANIMATION_IDLE, facing_direction)
			animation_playback.travel("idle")
		State.MOVE:
			animation_tree.set(ANIMATION_MOVE, facing_direction)
			animation_playback.travel("move")
		State.ATTACK:
			animation_tree.set(ANIMATION_ATTACK, facing_direction)
			animation_playback.travel("attack")

	move_and_slide()
