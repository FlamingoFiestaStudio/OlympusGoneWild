extends CharacterBody2D

signal shoot

const SPEED = 200

@onready var anim: AnimatedSprite2D = get_node("AnimatedSprite2D")

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	anim.play("Idle")

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
	
	if direction.length() > 0:
		anim.play("Running")
	else:
		anim.play("Idle")
	
	velocity = direction * SPEED

func _physics_process(_delta) -> void:
	move_and_slide()

func _on_weapon_shoot(Bullet: PackedScene, _position: Vector2, _direction: Vector2) -> void:
	emit_signal("shoot", Bullet, _position, _direction)
