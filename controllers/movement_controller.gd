class_name MovementController extends Node

@export var speed: float = 200.0
@export var dash_speed: float = 800.0
@export var dash_duration: float = 0.2

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

func dash() -> void:
	if body and not body.is_dashing and current_direction != Vector2.ZERO:
		execute_dash()

func execute_dash() -> void:
	body.is_dashing = true
	body.velocity = current_direction * dash_speed
	var tween = create_tween()
	tween.tween_interval(dash_duration)
	tween.finished.connect(func(): body.is_dashing = false)
	
	dash_loop()

func dash_loop() -> void:
	while body.is_dashing:
		body.move_and_slide()
		await get_tree().physics_frame
