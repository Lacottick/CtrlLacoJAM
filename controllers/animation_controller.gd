class_name AnimationController extends Node

@onready var animation_tree: AnimationTree = $"../AnimationTree"
@onready var move_state_machine = animation_tree.get("parameters/MoveStateMachine/playback")
@onready var attack_state_machine = animation_tree.get("parameters/AttackStateMachine/playback")

var character_id: int
var is_dead: bool = false
var animation_player: AnimationPlayer

func _ready() -> void:
	character_id = get_parent().get_instance_id()
	animation_tree.active = true
	CharacterEventBus.character_dead.connect(death_animation)


func update_animation(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		set_move_state("idle")
	else:
		var state_name = get_direction_string(direction)
		set_move_state(state_name)

func get_direction_string(direction: Vector2) -> String:
	var dir_name = ""
	if direction.y < 0: dir_name += "up"
	elif direction.y > 0: dir_name += "down"
	
	if direction.x > 0: dir_name += "right"
	elif direction.x < 0: dir_name += "left"
	
	return dir_name

func set_move_state(state_name: String) -> void:
	move_state_machine.travel(state_name)

func play_attack(skill_name: String) -> void:
	if attack_state_machine:
		attack_state_machine.travel(skill_name)
	
	animation_tree.set("parameters/AttackOneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)

func death_animation(target_id: int) -> void:
	if target_id == character_id:
		is_dead = true
		if animation_player.has_animation("dead"):
			animation_player.play("dead")
