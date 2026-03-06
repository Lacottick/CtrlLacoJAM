class_name ObjectHitboxController extends HitboxController

func _on_object_hitbox_controller_body_entered(body: Node2D) -> void:
	if body.is_in_group("Entities"):
		damage_received.emit(10)
