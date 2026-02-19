class_name WeaponController extends Node

func _ready()->void:
	if get_children().is_empty() or get_children().all(func(c): c is not Weapon):
		printerr("WEAPON_CONTROLLER PRECISA DE PELO MENOS UM NÓ FILHO DO TIPO WEAPON")
