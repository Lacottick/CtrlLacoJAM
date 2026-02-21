class_name Weapon extends Node

var weapon_data: WeaponData

@export
var actions_by_input: Dictionary[String, Skill]

func execute_attack(action_name: String) -> void:
	if actions_by_input.has(action_name):
		var skill = actions_by_input[action_name] as Skill
		if skill:
			skill.handle()
