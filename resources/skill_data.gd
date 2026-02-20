class_name SkillData extends Resource

@export
var name: StringName

@export
var damage: float

@export_range(0.1, 5.0, 0.5)
var speed: float

var cooldown: float:
	get:
		return  1.0/cooldown
