extends CharacterBody2D

enum States {
	Idle,
	Move,
}

@onready var movement: MovementController = $MovementController
@onready var idle_timer: Timer = $Timers/IdleTimer
@onready var move_timer: Timer = $Timers/MoveTimer

@export var min_idle_time: float = 1.0
@export var max_idle_time: float = 3.0
@export var min_move_time: float = 1.5
@export var max_move_time: float = 4.0

var current_state: States = States.Idle

func _ready() -> void:
	set_state(States.Idle)

func set_state(new_state: States) -> void:
	current_state = new_state
	match current_state:
		States.Idle:
			movement.set_direction(Vector2.ZERO)
			idle_timer.start(randf_range(min_idle_time, max_idle_time))
			
		States.Move:
			var random_dir = get_random_direction()
			movement.set_direction(random_dir)
			move_timer.start(randf_range(min_move_time, max_move_time))

func get_random_direction() -> Vector2:
	return Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _on_idle_timer_timeout() -> void:
	set_state(States.Move)

func _on_move_timer_timeout() -> void:
	set_state(States.Idle)
