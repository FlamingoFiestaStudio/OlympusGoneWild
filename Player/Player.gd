extends CharacterBody2D


const SPEED = 200
@onready var anim = get_node("AnimatedSprite2D")

func _ready():
	anim.play("Idle")

func _physics_process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("right"):
		velocity.x += 1
		anim.flip_h = false
		
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		anim.flip_h = true
		
	if Input.is_action_pressed("down"):
		velocity.y += 1
		
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		anim.play("Running")
	else:
		anim.play("Idle")
	position += velocity * delta
	
