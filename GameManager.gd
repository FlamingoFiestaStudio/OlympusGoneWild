extends Node

var player_damage: int = 6 : get = _get_player_damage, set = _set_player_damage
var player_score: int = 0 : get = _get_player_score, set = _set_player_score
var enemy_damage: int = 5 : get = _get_enemy_damage, set = _set_enemy_damage
var enemy_damage_multiplier: float = 1.2 : get = _get_enemy_damage_multiplier, set = _set_enemy_damage_multiplier
var enemy_spawn_multiplier: float = 0.8 : get = _get_enemy_spawn_multiplier, set = _set_enemy_spawn_multiplier

# Player Damage
func _get_player_damage() -> int:
	return player_damage

func _set_player_damage(new_value: int)  -> void:
	player_damage = new_value

# Player Score
func _get_player_score() -> int:
	return player_score

func _set_player_score(new_value: int)  -> void:
	player_score = new_value

# Enemy Damage
func _get_enemy_damage() -> int:
	return enemy_damage

func _set_enemy_damage(new_value: int)  -> void:
	enemy_damage = new_value

# Enemy Damage Multiplier
func _get_enemy_damage_multiplier() -> float:
	return enemy_damage_multiplier

func _set_enemy_damage_multiplier(new_value: float)  -> void:
	enemy_damage_multiplier = new_value
	
# Enemy Spawn Multiplier
func _get_enemy_spawn_multiplier() -> float:
	return enemy_spawn_multiplier

func _set_enemy_spawn_multiplier(new_value: float)  -> void:
	enemy_spawn_multiplier = new_value
