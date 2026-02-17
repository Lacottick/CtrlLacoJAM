extends CharacterBody2D

@export var damage_amount: float = 10.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attack_timer: Timer = $AttackTimer

func _physics_process(_delta: float) -> void:
	if animation_player.animation_finished:
		attack_timer.start()

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var target_id = body.get_instance_id()
		CharacterEventBus.take_damage.emit(target_id, damage_amount)
		print("Enviando ", damage_amount, " de dano para o ID: ", target_id)

func _on_attack_timer_timeout() -> void:
	animation_player.play("attack")
