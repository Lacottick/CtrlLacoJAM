extends Skill

@onready var attack_area: Area2D = $AttackArea
@onready var sprite: Sprite2D = $Sprite2D2

func handle() -> void:
	if target_hitbox:
		target_hitbox.take_damage(data.damage)


func _on_attack_area_area_entered(area: Area2D) -> void:
	if area is HitboxController:
		target_hitbox = area

func _on_attack_area_area_exited(area: Area2D) -> void:
	if area == target_hitbox:
		target_hitbox = null
