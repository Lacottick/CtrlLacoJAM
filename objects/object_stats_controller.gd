class_name ObjectStatsController extends Node

signal destroy

@export var durability: float = 10.0

var character_id: int

func _ready() -> void:
	character_id = get_parent().get_instance_id()

func take_damage(target_id: int, amount: float) -> void:
	if target_id == character_id:
		change_health(amount)

func change_health(amount: float) -> void:
	durability -= amount
	
	if durability <= 0:
		destroy.emit()
