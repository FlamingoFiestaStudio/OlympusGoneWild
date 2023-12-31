extends CharacterBody2D

class_name Player

signal shoot

const SPEED: int = 200

var direction: Vector2 = Vector2.ZERO
var health: int = 100

@onready var anim: AnimatedSprite2D = get_node("AnimatedSprite2D")

func _process(_delta) -> void:
	_control()

func _control() -> void:
	direction = Vector2() # Reset direction
	
	if Input.is_action_pressed("right"):
		direction.x += 1
		anim.flip_h = false
	
	if Input.is_action_pressed("left"):
		direction.x -= 1
		anim.flip_h = true
	
	if Input.is_action_pressed("down"):
		direction.y += 1
	
	if Input.is_action_pressed("up"):
		direction.y -= 1
	
	if not anim.animation == "Attacking":
		anim.play("Running" if direction.length() > 0 else "Idle")
	
	velocity = direction * SPEED

func _physics_process(_delta) -> void:
	move_and_slide()

func _on_weapon_shoot(Bullet: PackedScene, _position: Vector2, _direction: Vector2) -> void:
	anim.play("Attacking")
	emit_signal("shoot", Bullet, _position, _direction)

func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "Attacking": anim.play("Idle")

func hit(damage: int) -> void:
	health -= damage
