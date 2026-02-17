extends CharacterBody2D

@export var speed: float = 200.0

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var direction := Vector2.ZERO
var non_normal_dir := Vector2.ZERO

func _physics_process(delta):
	var input_dir = Vector2.ZERO
	
	# Movimento normal
	if Input.is_action_pressed("right"):
		input_dir.x += 1
	if Input.is_action_pressed("left"):
		input_dir.x -= 1
	if Input.is_action_pressed("down"):
		input_dir.y += 1
	if Input.is_action_pressed("up"):
		input_dir.y -= 1
	
	non_normal_dir = input_dir
	input_dir = input_dir.normalized()
	
	# Animações
	if input_dir == Vector2.ZERO:
		animation_player.play("idle")
	else:
		if abs(input_dir.x) > abs(input_dir.y):
			if input_dir.x > 0:
				animation_player.play("right")
			else:
				animation_player.play("left")
		else:
			if input_dir.y > 0:
				animation_player.play("down")
			else:
				animation_player.play("up")
	
	if input_dir != Vector2.ZERO:
		direction = input_dir
	velocity = input_dir * speed

	move_and_slide()
