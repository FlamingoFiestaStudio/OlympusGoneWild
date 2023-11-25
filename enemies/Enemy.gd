extends CharacterBody2D

const MAX_SPEED: int = 100

@export var DAMAGE: int

var current_speed: int = MAX_SPEED
var health: int = 10
var is_alive: bool = true
var player: Player

@onready var AttackTimer: Timer = get_node("AttackTimer")
@onready var anim: AnimatedSprite2D = get_node("AnimatedSprite2D")

func initialize_enemy(target_player: Player) -> void:
	player = target_player

func hit() -> void:
	health -= GameManager.player_damage
	anim.play("Hit")
	if health < 0: _death()

func _attack() -> void:
	player.call_deferred("hit", DAMAGE)
	anim.play("Attack")
	
func _death() -> void:
	anim.play("Death")
	is_alive = false
	GameManager.player_score += 1
	# Only leave the Animated Sprite
	get_node("CollisionShape2D").queue_free()
	get_node("Area2D").queue_free()
	AttackTimer.queue_free()

func _process(_delta: float) -> void:
	if not is_alive: return
	var x_direction = (player.global_position - global_position).x
	anim.flip_h = x_direction <= 0

func _physics_process(_delta: float) -> void:
	if player and is_alive:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * current_speed
		
		move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		current_speed = 0
		_attack()
		AttackTimer.start()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		current_speed = MAX_SPEED
		AttackTimer.stop()
		anim.play("Walk")

func _on_attack_timer_timeout() -> void:
	_attack()

func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "Hit" or anim.animation == "Attack": anim.play("Walk")
	elif anim.animation == "Death": queue_free()
