class_name HitboxController extends Area2D

signal damage_received(amount: float)

func take_damage(amount: float) -> void:
	damage_received.emit(amount)
	print("Dano recebido no Controller: ", amount)
