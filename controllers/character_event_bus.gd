extends Node

signal health_update
signal max_health_update

signal take_damage(target_id: int, amount: float)
signal character_dead

signal move_requested(entity_id: int, direction: Vector2)
# signal attack_requested(entity_id: int)
# signal health_changed(entity_id: int, current_health: float)
