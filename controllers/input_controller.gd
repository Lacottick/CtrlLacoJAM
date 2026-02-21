class_name InputController extends Node

signal direction_changed(direction: Vector2)
signal action_performed(action_name: String)

var is_locked: bool = false

func _ready() -> void:
	CharacterEventBus.character_dead.connect(input_lock)

func _process(_delta: float) -> void:
	if is_locked: 
		direction_changed.emit(Vector2.ZERO)
		return
	
	var input_dir = Vector2.ZERO
	input_dir.x = Input.get_axis("left", "right")
	input_dir.y = Input.get_axis("up", "down")
	
	if input_dir != Vector2.ZERO:
		input_dir = input_dir.normalized()
	
	direction_changed.emit(input_dir)
	
	if Input.is_action_just_pressed("attack"):
		action_performed.emit("attack")
	
	if Input.is_action_just_pressed("special"):
		action_performed.emit("special")
	
	if Input.is_action_just_pressed("switch_weapon"):
		action_performed.emit("switch_weapon")

func input_lock() -> void:
	is_locked = true

func input_unlock() -> void:
	is_locked = false
