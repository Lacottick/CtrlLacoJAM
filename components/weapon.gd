class_name Weapon extends Node


var weapon_data: WeaponData

@export
var actions_by_input: Dictionary[InputEventAction, Skill]

func _input(event: InputEvent):
	for action in actions_by_input.keys():
		if event.is_action_released(action):
			var skill = actions_by_input[action] as Skill
			skill.handle()
			break
