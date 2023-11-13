extends CharacterBody2D

const SPEED = 100
var player: Player

func _physics_process(_delta) -> void:
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * SPEED
		
		move_and_slide()

func initialize_enemy(target_player: Player) -> void:
	player = target_player
