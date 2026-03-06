extends StaticBody2D

@onready var object_hitbox: ObjectHitboxController = $ObjectHitboxController
@onready var object_stats: ObjectStatsController = $ObjectStatsController

@export var character_id: int

func _ready():
	character_id = get_instance_id()
	object_hitbox.damage_received.connect(on_hitbox_damaged)
	object_stats.destroy.connect(on_destroyed)

func on_hitbox_damaged(amount: float) -> void:
	object_stats.take_damage(character_id, amount)

func on_destroyed() -> void:
	queue_free()
