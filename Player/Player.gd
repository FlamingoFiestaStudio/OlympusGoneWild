extends CharacterBody2D


const speed = 200
@onready var anim = get_node("AnimatedSprite2D")

func _ready():
	anim.play("Idle")

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		anim.play("Running")
	else:
		anim.play("Idle")
	position += velocity * delta
	
