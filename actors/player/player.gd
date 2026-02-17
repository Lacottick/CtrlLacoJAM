extends CharacterBody2D

@onready var input = $InputController
@onready var movement = $MovementController
@onready var animation = $AnimationController

func _ready():
	input.direction_changed.connect(movement.set_direction)
	input.direction_changed.connect(animation.update_animation)
	input.action_performed.connect(_on_action)

func _on_action(action: String):
	if action == "attack":
		pass
