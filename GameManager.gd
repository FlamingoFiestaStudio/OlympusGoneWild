extends Node

var player_damage: int = 6 : get = _get_player_damage, set = _set_player_damage
var player_score: int = 0 : get = _get_player_score, set = _set_player_score

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
