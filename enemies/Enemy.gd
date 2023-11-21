extends CharacterBody2D

@export var DAMMAGE: int

const MAX_SPEED: int = 100

var current_speed: int = MAX_SPEED
var player: Player

@onready var AttackTimer: Timer = get_node("AttackTimer")

func _physics_process(_delta) -> void:
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * current_speed
		
		move_and_slide()

func initialize_enemy(target_player: Player) -> void:
	player = target_player

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		current_speed = 0
		player.call_deferred("hit", DAMMAGE)
		AttackTimer.start()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		current_speed = MAX_SPEED
		AttackTimer.stop()

func _on_attack_timer_timeout() -> void:
	player.call_deferred("hit", DAMMAGE)
