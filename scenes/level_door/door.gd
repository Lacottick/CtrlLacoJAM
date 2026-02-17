extends Area2D

@export_file("*.tscn") var travel_scene_path: String

var player_in_range: bool = false

func _process(_delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		change_level()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_in_range = true
		print("Pressione 'interact' para entrar")

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_in_range = false

func change_level() -> void:
	if travel_scene_path == "":
		print("Nenhuma cena configurada")
		return
	
	var change = get_tree().change_scene_to_file(travel_scene_path)
	
	if change != OK:
		print("Erro ao carregar a cena: ", change)
