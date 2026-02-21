extends CharacterBody2D

@onready var input: InputController = $InputController
@onready var movement: MovementController = $MovementController
@onready var animation: AnimationController = $AnimationController
@onready var hitbox: HitboxController = $HitboxController
@onready var stats: StatsController = $StatsController
@onready var weapon: WeaponController = $WeaponController

@export var character_id: int

func _ready():
	character_id = get_instance_id()
	input.direction_changed.connect(movement.set_direction)
	input.direction_changed.connect(animation.update_animation)
	input.action_performed.connect(on_action)
	hitbox.damage_received.connect(on_hitbox_damaged)
	stats.character_dead.connect(on_entity_died)

func on_action(action: String):
	if action == "attack" or action == "special":
		weapon.handle_attack(action)
	
	if action == "switch_weapon": 
		weapon.switch_weapon()

func on_hitbox_damaged(amount: float) -> void:
	stats.take_damage(stats.character_id, amount)

func on_entity_died() -> void:
	animation.death_animation(character_id)
