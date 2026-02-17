class_name MovementController extends Node

@export var speed: float = 200.0
var current_direction: Vector2 = Vector2.ZERO
var body: CharacterBody2D

func _ready() -> void:
	if get_parent() is CharacterBody2D:
		body = get_parent()
	else:
		push_error("MovementController: O pai deve ser um CharacterBody2D!")

func set_direction(dir: Vector2) -> void:
	current_direction = dir

func _physics_process(_delta: float) -> void:
	if body:
		body.velocity = current_direction * speed
		body.move_and_slide()
