class_name AnimationController extends Node

@export var animation_player_path: NodePath
var animation_player: AnimationPlayer

func _ready() -> void:
	if animation_player_path:
		animation_player = get_node(animation_player_path)
	else:
		animation_player = get_parent().get_node_or_null("AnimationPlayer")

func update_animation(direction: Vector2) -> void:
	if !animation_player: return
	
	if direction == Vector2.ZERO:
		if animation_player.has_animation("idle"):
			animation_player.play("idle")
	else:
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				animation_player.play("right")
			else:
				animation_player.play("left")
		else:
			if direction.y > 0:
				animation_player.play("down")
			else:
				animation_player.play("up")
