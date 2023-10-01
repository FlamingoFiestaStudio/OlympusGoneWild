extends CharacterBody2D


var direction = Vector2()
const SPEED = 200
@onready var anim = get_node("AnimatedSprite2D")


func _ready():
	anim.play("Idle")


func _process(delta):
	direction = Vector2() #Reset direction
	
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
		direction = direction.normalized() * SPEED
		anim.play("Running")
	else:
		anim.play("Idle")


func _physics_process(delta):
	position += direction * delta
	