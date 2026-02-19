class_name StatsController extends Node

signal character_dead

@export var max_health: float = 20.0
@export var base_damage: float = 5.0

var character_id: int
var current_health: float

func _ready() -> void:
	current_health = max_health
	character_id = get_parent().get_instance_id()

func take_damage(target_id: int, amount: float) -> void:
	if target_id == character_id:
		change_health(amount)

func change_health(amount: float) -> void:
	current_health -= amount
	CharacterEventBus.health_update.emit(current_health)
	print(get_parent().name, " recebeu dano! Vida atual: ", current_health)
	
	if current_health <= 0:
		character_dead.emit()
