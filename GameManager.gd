extends Node

var player_damage: int = 6 : get = _get_player_damage, set = _set_player_damage
var player_score: int = 0 : get = _get_player_score, set = _set_player_score
var player_health: int = 100 : get = _get_player_health, set = _set_player_health

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

# Player Health
func _get_player_health() -> int:
	return player_health

func _set_player_health(new_value: int)  -> void:
	player_health = new_value
