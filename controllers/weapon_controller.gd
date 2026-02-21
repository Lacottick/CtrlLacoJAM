class_name WeaponController extends Node

var current_weapon: Weapon = null
var weapon_index: int = 0

func _ready()->void:
	if get_children().is_empty() or get_children().all(func(c): c is not Weapon):
		push_error("WEAPON_CONTROLLER PRECISA DE PELO MENOS UM NÓ FILHO DO TIPO WEAPON")
	update_active_weapon()

func update_active_weapon() -> void:
	var children = get_children()
	if children.size() > 0:
		current_weapon = children[weapon_index] as Weapon
		print("Arma ativa: ", current_weapon.name)

func switch_weapon() -> void:
	weapon_index = (weapon_index + 1) % get_child_count()
	update_active_weapon()

func handle_attack(action: String) -> void:
	if current_weapon:
		current_weapon.execute_attack(action)
