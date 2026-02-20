extends CharacterBody2D

@export var damage_amount: float = 10.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attack_timer: Timer = $AttackTimer

var target_hitbox: HitboxController = null

func _ready() -> void:
	animation_player.animation_finished.connect(_on_animation_finished)
	attack_timer.start()

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "attack":
		attack_timer.start()

func _on_attack_area_area_entered(area: Area2D) -> void:
	if area is HitboxController:
		target_hitbox = area

func _on_attack_area_area_exited(area: Area2D) -> void:
	if area == target_hitbox:
		target_hitbox = null
		print("Alvo saiu da área.")

func _on_attack_timer_timeout() -> void:
	if target_hitbox:
		animation_player.play("attack")
		target_hitbox.take_damage(damage_amount) 
		print("Dano: ", damage_amount, " enviado para: ", target_hitbox.get_parent().name)
	else:
		attack_timer.start()

func get_damage() -> float:
	return damage_amount
