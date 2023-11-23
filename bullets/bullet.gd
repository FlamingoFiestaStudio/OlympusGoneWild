extends Area2D

@export var speed: int

var velocity: Vector2 = Vector2.ZERO
var acceleration: Vector2 = Vector2.ZERO

func start(_position: Vector2, _direction: Vector2) -> void:
	position = _position
	rotation = _direction.angle()
	velocity = _direction * speed

func _physics_process(delta: float) -> void:
	velocity += acceleration * delta
	velocity = velocity.limit_length(speed)
	rotation = velocity.angle()
	position += velocity * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("BulletDestroyer"):
		if body.is_in_group("Enemy"): body.call_deferred("hit")
		queue_free()
