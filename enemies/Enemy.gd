extends CharacterBody2D

const MAX_SPEED: int = 100

var current_speed: int = MAX_SPEED
var health: int = 10
var player: Player

@onready var AttackTimer: Timer = get_node("AttackTimer")

func initialize_enemy(target_player: Player) -> void:
	player = target_player

func hit() -> void:
	health -= GameManager.player_damage
	if health < 0: _death()
	
func _death() -> void:
	GameManager.player_score += 1
	queue_free()

func _physics_process(_delta) -> void:
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * current_speed
		
		move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		current_speed = 0
		player.call_deferred("hit", GameManager.player_damage)
		AttackTimer.start()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		current_speed = MAX_SPEED
		AttackTimer.stop()

func _on_attack_timer_timeout() -> void:
	player.call_deferred("hit", GameManager.player_damage)
