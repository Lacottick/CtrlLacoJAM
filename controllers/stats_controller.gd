class_name StatsController extends Node

signal dead
signal health_changed(current: float, max_f: float)

@export var max_health: float = 20.0
@export var base_damage: float = 5.0
var current_health: float

func _ready() -> void:
	current_health = max_health

func take_damage(amount: float) -> void:
	current_health -= amount
	health_changed.emit(current_health, max_health)
	
	# Exemplo de uso do EventBus para notificar o sistema global (UI, etc)
	if Engine.has_singleton("EventBus"):
		get_node("/root/EventBus").health_changed.emit(get_parent().get_instance_id(), current_health)
	
	if current_health <= 0:
		die()

func die() -> void:
	dead.emit()
	get_parent().queue_free()
